module UiComponents
    class MinimizeButton
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
                    [[110, 10], [100, 22]]
                ).tap do |button|
                    button.translatesAutoresizingMaskIntoConstraints = false
                    button.bezelStyle = NSShadowlessSquareBezelStyle
                    button.buttonType = NSMomentaryChangeButton
                    button.title = 'Minimize'
                    button.target = MainAppWindow.get
                    button.action = 'minimize:'
                end
            end
    end
end