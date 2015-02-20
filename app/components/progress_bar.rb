module UiComponents
    class ProgressBar
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
                @uiComponent = NSSlider.alloc.initWithFrame(
                    [[10, 10], [100, 22]]
                ).tap do |slider|
                    slider.setMinValue(0)
                    slider.translatesAutoresizingMaskIntoConstraints = false
                end
            end
    end
end