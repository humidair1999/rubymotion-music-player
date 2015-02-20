module UiComponents
    class CloseButton
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
                    [[10, 10], [100, 22]]
                ).tap do |button|
                    button.translatesAutoresizingMaskIntoConstraints = false
                    button.bezelStyle = NSShadowlessSquareBezelStyle
                    button.buttonType = NSMomentaryChangeButton
                    button.title = 'Close'
                    # button.bordered = true
                    # button.image = NSImage.imageNamed('img/circle')
                    # p button.image
                    # button.imagePosition = NSImageOnly
                    button.target = MainAppWindow.get.getUiComponent
                    button.action = 'close'
                end
            end
    end
end