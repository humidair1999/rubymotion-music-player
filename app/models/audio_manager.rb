# TODO: some sort of middleware function for this "if audioPlayer" bullshit?

class AudioManager
    def initialize
        @audioPlayer = nil
        @audioPlayerVolume = nil

        @dispatchQueue = Dispatch::Queue.new('playingSongQueue')
        @dispatchQueue.suspend!

        attachSubscribers

        attachPlayingSongQueueTimer
    end

    def attachSubscribers
        NSNotificationCenter.defaultCenter.addObserver(self,
              selector: 'initializeAudio:',
              name: 'playNewSong',
              object: nil
        )

        NSNotificationCenter.defaultCenter.addObserver(self,
              selector: 'seekToSongPosition:',
              name: 'progressNsSlider:moveSliderPosition',
              object: nil
        )

        NSNotificationCenter.defaultCenter.addObserver(self,
              selector: 'changeVolume:',
              name: 'volumeNsSlider:moveSliderPosition',
              object: nil
        )
    end

    def initializeAudio(sender)
        filePath = sender.userInfo[:filePath]

        stop

        @audioPlayer = nil

        @audioPlayer = NSSound.alloc.initWithContentsOfFile(filePath, byReference: true).tap do |player|
            player.delegate = self
        end

        @audioPlayer.volume = @audioPlayerVolume if @audioPlayerVolume

        play
    end

    def seekToSongPosition(sender)
        if @audioPlayer
            newTime = sender.userInfo

            pause

            @audioPlayer.currentTime = newTime

            resume
        end
    end

    def changeVolume(sender)
        newVolume = sender.userInfo

        @audioPlayerVolume = newVolume

        @audioPlayer.volume = @audioPlayerVolume if @audioPlayer
    end

    def stop
        p 'STOP'

        @audioPlayer.stop if @audioPlayer
    end

    def play
        p 'PLAY'

        if @audioPlayer
            @audioPlayer.play

            NSNotificationCenter.defaultCenter.postNotificationName('audioManager:play',
                object: self,
                userInfo: {
                    duration: @audioPlayer.duration.round(2)
                }
            )

            startSendingPlayingSongInfo
        end
    end

    def attachPlayingSongQueueTimer
        Dispatch::Source.timer(0, 0.2, 0.4, @dispatchQueue) do |s|
            NSNotificationCenter.defaultCenter.postNotificationName('audioManager:startSendingPlayingSongInfo',
                object: self,
                userInfo: {
                    currentTime: @audioPlayer.currentTime.round(2)
                }
            )
        end
    end

    def startSendingPlayingSongInfo
        @dispatchQueue.resume!
    end

    def stopSendingPlayingSongInfo
        @dispatchQueue.suspend! if !@dispatchQueue.suspended?
    end

    def pause
        @audioPlayer.pause if @audioPlayer
    end

    def resume
        if @audioPlayer
            @audioPlayer.resume

            NSNotificationCenter.defaultCenter.postNotificationName('audioManager:resume',
                object: self
            )
        end
    end

    def sound(sound, didFinishPlaying: finishedPlaying)
        p 'didFinishPlaying'

        stopSendingPlayingSongInfo

        NSNotificationCenter.defaultCenter.postNotificationName('audioManager:stop',
            object: self
        )
    end
end