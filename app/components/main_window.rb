module UiComponents
    class MainWindow
        include AppHelper

        def initialize
            @uiComponent = nil

            createUiComponent

            MainAppWindow.set(self)
        end

        def getUiComponent
            @uiComponent
        end

        def minimize(sender)
            p sender

            getUiComponent.miniaturize sender
            # TODO: set window title to songtitle
            getUiComponent.setMiniwindowTitle('Get fucked')
            # TODO: set miniwindow image?
        end

        def maximize(sender)
            p sender

            getUiComponent.setFrame(
                NSScreen.mainScreen.visibleFrame,
                display: true,
                animate: true
            )
        end

        private

            def createUiComponent
                visibleArea = NSScreen.mainScreen.visibleFrame

                @uiComponent = CustomNSWindow.alloc.initWithContentRect(
                    [[0, NSHeight(visibleArea)], [(NSWidth(visibleArea) / 2), (NSHeight(visibleArea) / 2)]],
                    styleMask: NSBorderlessWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask,
                    backing: NSBackingStoreBuffered,
                    defer: false
                ).tap do |window|
                    window.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
                    # window.setAlphaValue(0.9)
                    window.setBackgroundColor(NSColor.colorWithCalibratedRed(28.0/255.0, green: 42.0/255.0, blue: 57.0/255.0, alpha: 255.0/255.0))
                    # window.setOpaque(false)
                    window.orderFrontRegardless
                end
            end
    end
end