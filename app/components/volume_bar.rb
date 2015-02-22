module UiComponents
    class VolumeBar
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
                @uiComponent = VolumeNSSlider.alloc.initWithFrame(
                    [[10, 10], [100, 22]]
                ).tap do |slider|
                    slider.minValue = 0.0
                    slider.maxValue = 1.0
                    slider.floatValue = 1.0
                    slider.translatesAutoresizingMaskIntoConstraints = false
                end
            end
    end
end