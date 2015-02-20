module UiComponents
    module MainWindow
        def MainWindow.create
            visibleArea = NSScreen.mainScreen.visibleFrame

            CustomNSWindow.alloc.initWithContentRect(
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