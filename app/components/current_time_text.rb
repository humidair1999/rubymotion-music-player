module UiComponents
    class CurrentTimeText
        include AppHelper

        def initialize
            @uiComponent = nil

            createUiComponent

            attachSubscribers
        end

        def attachSubscribers
            NSNotificationCenter.defaultCenter.addObserver(self,
                  selector: 'setCurrentTimeToZero',
                  name: 'audioManager:play',
                  object: nil
            )

            NSNotificationCenter.defaultCenter.addObserver(self,
                  selector: 'clearCurrentTime',
                  name: 'audioManager:stop',
                  object: nil
            )

            NSNotificationCenter.defaultCenter.addObserver(self,
                  selector: 'updateCurrentTime:',
                  name: 'audioManager:startSendingPlayingSongInfo',
                  object: nil
            )
        end

        def getUiComponent
            @uiComponent
        end

        def setCurrentTimeToZero
            getUiComponent.stringValue = '00:00'
        end

        def clearCurrentTime
            getUiComponent.stringValue = ''
        end

        def updateCurrentTime(sender)
            currentTime = sender.userInfo[:currentTime]

            getUiComponent.setStringValue(Time.at(currentTime).utc.strftime("%M:%S"))
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

                    # textField.stringValue = 'current'

                    textField.setTextColor(NSColor.colorWithCalibratedRed(188.0/255.0, green: 202.0/255.0, blue: 217.0/255.0, alpha: 255.0/255.0))
                end
            end
    end
end