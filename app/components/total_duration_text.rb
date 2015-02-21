module UiComponents
    class TotalDurationText
        include AppHelper

        def initialize
            @uiComponent = nil

            createUiComponent

            attachSubscribers
        end

        def attachSubscribers
            NSNotificationCenter.defaultCenter.addObserver(self,
                  selector: 'updateTotalDuration:',
                  name: 'audioManager:play',
                  object: nil
            )
        end

        def getUiComponent
            @uiComponent
        end

        def updateTotalDuration(sender)
            songDuration = sender.userInfo[:duration]

            p songDuration

            getUiComponent.setMaxValue(songDuration)
        end

        private

            def createUiComponent
                @uiComponent = NSTextField.alloc.initWithFrame(
                    [[100, 100], [100, 220]]
                ).tap do |textField|
                    textField.translatesAutoresizingMaskIntoConstraints = false
                    textField.setStringValue('hahaha')
                end
            end
    end
end