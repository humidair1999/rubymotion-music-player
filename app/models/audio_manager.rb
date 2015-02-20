class AudioManager
    def initialize
        p 'CREATED AudioManager'

        attachSubscribers
    end

    def attachSubscribers
        NSNotificationCenter.defaultCenter.addObserver(self,
              selector: 'receiveTestNotification:',
              name: 'testNotification',
              object: nil
        )
    end

    def receiveTestNotification(sender)
        p 'GOT IT' + sender.userInfo[:filePath]
    end
end