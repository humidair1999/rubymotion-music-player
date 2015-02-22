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
                    neutralImgPath = NSBundle.mainBundle.pathForResource("img/circle2", ofType: "png")
                    neutralImgUrl = NSURL.fileURLWithPath(neutralImgPath)
                    neutralImg = NSImage.alloc.initWithContentsOfURL(neutralImgUrl)

                    button.setImage(neutralImg)

                    activeImgPath = NSBundle.mainBundle.pathForResource("img/circle", ofType: "png")
                    activeImgUrl = NSURL.fileURLWithPath(activeImgPath)
                    activeImg = NSImage.alloc.initWithContentsOfURL(activeImgUrl)

                    button.setAlternateImage(activeImg)

                    button.setImageScaling(NSImageScaleProportionallyDown)
                    button.setImagePosition(NSImageOnly)

                    button.translatesAutoresizingMaskIntoConstraints = false
                    button.bordered = false
                    button.bezelStyle = NSShadowlessSquareBezelStyle
                    button.buttonType = NSMomentaryChangeButton

                    button.target = MainAppWindow.get.getUiComponent
                    button.action = 'close'
                end
            end
    end
end