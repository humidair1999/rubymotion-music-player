class AudioManager
    def initialize
        @audioPlayer = nil

        attachSubscribers
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

            initializeAudio(sender)
        else
            @audioPlayer = NSSound.alloc.initWithContentsOfFile(filePath, byReference: true).tap do |player|
                player.delegate = self
            end

            play
        end
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