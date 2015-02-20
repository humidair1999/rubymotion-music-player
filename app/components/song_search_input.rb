module UiComponents
    class SongSearchInput
        include AppHelper

        def initialize
            @uiComponent = nil

            createUiComponent
        end

        def getUiComponent
            @uiComponent
        end

        private

            def createUiComponent
                @uiComponent = NSTextField.alloc.initWithFrame(
                    [[210, 10], [100, 22]]
                ).tap do |textInput|
                    textInput.translatesAutoresizingMaskIntoConstraints = false
                    textInput.setEditable(true)
                    textInput.setDelegate(self)
                end
            end

            def controlTextDidChange(notification)
                p notification.object.stringValue

                NSNotificationCenter.defaultCenter.postNotificationName('songSearchInput:controlTextDidChange',
                    object: self,
                    userInfo: notification.object.stringValue
                )

                # TODO: use notification instead of direct manipulation

                # @trackListCtrl.filterSongs(notification.object.stringValue)
            end
    end
end