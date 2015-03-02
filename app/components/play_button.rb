module UiComponents
    class PlayButton
        include AppHelper

        def initialize
            @uiComponent = nil

            createUiComponent

            attachSubscribers
        end

        def attachSubscribers
            NSNotificationCenter.defaultCenter.addObserver(self,
                  selector: 'switchToPauseButton',
                  name: 'audioManager:play',
                  object: nil
            )

            NSNotificationCenter.defaultCenter.addObserver(self,
                  selector: 'switchToPauseButton',
                  name: 'audioManager:resume',
                  object: nil
            )

            NSNotificationCenter.defaultCenter.addObserver(self,
                  selector: 'switchToPlayButton',
                  name: 'audioManager:stop',
                  object: nil
            )

            NSNotificationCenter.defaultCenter.addObserver(self,
                  selector: 'switchToPlayButton',
                  name: 'audioManager:pause',
                  object: nil
            )
        end

        def getUiComponent
            @uiComponent
        end

        def switchToPauseButton
            getUiComponent.setState(NSOnState)
        end

        def switchToPlayButton
            getUiComponent.setState(NSOffState)
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
                    button.bordered = true
                    button.bezelStyle = NSShadowlessSquareBezelStyle
                    button.buttonType = NSToggleButton

                    button.target = self
                    button.action = 'play'
                end
            end

            def play
                p getUiComponent.state

                if (getUiComponent.state == 0)
                    p 'pause'

                    NSNotificationCenter.defaultCenter.postNotificationName('playButton:pause',
                        object: self
                    )
                elsif (getUiComponent.state == 1)
                    p 'resume'

                    NSNotificationCenter.defaultCenter.postNotificationName('playButton:resume',
                        object: self
                    )
                end
            end
    end
end