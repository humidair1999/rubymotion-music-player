class AudioManager
    def initialize
        @audioPlayer = nil

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
    end

    def initializeAudio(sender)
        filePath = sender.userInfo[:filePath]

        if !@audioPlayer.nil?
            stop

            @audioPlayer = nil
        end

        @audioPlayer = NSSound.alloc.initWithContentsOfFile(filePath, byReference: true).tap do |player|
            player.delegate = self
        end

        play
    end

    def seekToSongPosition(sender)
        pause

        @audioPlayer.currentTime = sender.userInfo

        resume
    end

    def stop
        p 'STOP'

        @audioPlayer.stop
    end

    def play
        p 'PLAY'

        @audioPlayer.play

        NSNotificationCenter.defaultCenter.postNotificationName('audioManager:play',
            object: self,
            userInfo: {
                duration: @audioPlayer.duration.round(2)
            }
        )

        startSendingPlayingSongInfo
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
        @audioPlayer.pause
    end

    def resume
        @audioPlayer.resume

        NSNotificationCenter.defaultCenter.postNotificationName('audioManager:resume',
            object: self
        )
    end

    def sound(sound, didFinishPlaying: finishedPlaying)
        p 'didFinishPlaying'

        stopSendingPlayingSongInfo

        NSNotificationCenter.defaultCenter.postNotificationName('audioManager:stop',
            object: self
        )
    end
end