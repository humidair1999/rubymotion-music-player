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

            getUiComponent.setStringValue(Time.at(songDuration).utc.strftime("%M:%S"))
        end

        private

            def createUiComponent
                @uiComponent = NSTextField.alloc.initWithFrame(
                    [[100, 100], [100, 220]]
                ).tap do |textField|
                    textField.editable = false
                    textField.translatesAutoresizingMaskIntoConstraints = false

                    textField.setSelectable(false)
                    textField.setBezeled(false)
                    textField.setDrawsBackground(false)
                    textField.setBordered(false)

                    textField.setTextColor(NSColor.colorWithCalibratedRed(188.0/255.0, green: 202.0/255.0, blue: 217.0/255.0, alpha: 255.0/255.0))
                end
            end
    end
end