module UiComponents
    class MaximizeButton
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
                @uiComponent = NSButton.alloc.initWithFrame(
                    [[210, 10], [100, 22]]
                ).tap do |button|
                    button.translatesAutoresizingMaskIntoConstraints = false
                    button.bezelStyle = NSShadowlessSquareBezelStyle
                    button.buttonType = NSMomentaryChangeButton
                    button.title = 'Maximize'
                    button.target = MainAppWindow.get
                    button.action = 'maximize:'
                end
            end
    end
end