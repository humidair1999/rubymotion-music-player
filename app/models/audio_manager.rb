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
    end

    def initializeAudio(sender)
        filePath = sender.userInfo[:filePath]

        p 'init audio'

        if !@audioPlayer.nil?
            @audioPlayer.stop

            @audioPlayer = nil
        end

        @audioPlayer = NSSound.alloc.initWithContentsOfFile(filePath, byReference: true).tap do |player|
            player.delegate = self
        end

        play
    end

    def play
        p 'PLAY'

        @audioPlayer.play

        NSNotificationCenter.defaultCenter.postNotificationName('audioManager:play',
            object: self,
            userInfo: {
                duration: @audioPlayer.duration
            }
        )

        startNotifyWhilePlaying
    end

    def attachPlayingSongQueueTimer
        Dispatch::Source.timer(0, 1, 0.5, @dispatchQueue) do |s|
            puts @audioPlayer.duration
        end
    end

    def startNotifyWhilePlaying
        @dispatchQueue.resume!
    end

    def stopNotifyWhilePlaying
        p @dispatchQueue.suspended?
    end

    def pause
        @audioPlayer.pause
    end

    def resume
        @audioPlayer.resume
    end

    def sound(sound, didFinishPlaying: finishedPlaying)
        p 'audio finished playing'
    end
end