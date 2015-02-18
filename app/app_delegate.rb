class AppDelegate
    def applicationDidFinishLaunching(notification)
        buildMenu
        buildWindow
    end

    def buildWindow
        @mainWindow = NSWindow.alloc.initWithContentRect(
            [[240, 180], [480, 360]],
            styleMask: NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask,
            backing: NSBackingStoreBuffered,
            defer: false
        ).tap do |window|
            window.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
            # window.setAlphaValue(0.9)
            window.setBackgroundColor(NSColor.colorWithCalibratedRed(28.0/255.0, green: 42.0/255.0, blue: 57.0/255.0, alpha: 255.0/255.0))
            # window.setOpaque(false)
            window.orderFrontRegardless
        end

        buildCloseButton
        buildMinimizeButton
        buildMaximizeButton
    end

    private

        def buildCloseButton
            @closeButton = NSButton.alloc.initWithFrame(
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
                button.target = @mainWindow
                button.action = 'close'
            end

            @mainWindow.contentView.addSubview(@closeButton)

            @mainWindow.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @closeButton,
                attribute: NSLayoutAttributeTop,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.contentView,
                attribute: NSLayoutAttributeTop,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @closeButton,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.contentView,
                attribute: NSLayoutAttributeLeft,
                multiplier: 1.0,
                constant: 10.0
            ))
        end

        def buildMinimizeButton
            @minimizeButton = NSButton.alloc.initWithFrame(
                [[110, 10], [100, 22]]
            ).tap do |button|
                button.translatesAutoresizingMaskIntoConstraints = false
                button.bezelStyle = NSShadowlessSquareBezelStyle
                button.buttonType = NSMomentaryChangeButton
                button.title = 'Minimize'
                button.target = self
                button.action = 'minimize:'
            end

            @mainWindow.contentView.addSubview(@minimizeButton)

            @mainWindow.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @minimizeButton,
                attribute: NSLayoutAttributeTop,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.contentView,
                attribute: NSLayoutAttributeTop,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @minimizeButton,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @closeButton,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: 10.0
            ))
        end

        def buildMaximizeButton
            @maximizeButton = NSButton.alloc.initWithFrame(
                [[210, 10], [100, 22]]
            ).tap do |button|
                button.translatesAutoresizingMaskIntoConstraints = false
                button.bezelStyle = NSShadowlessSquareBezelStyle
                button.buttonType = NSMomentaryChangeButton
                button.title = 'Maximize'
                button.target = self
                button.action = 'maximize:'
            end

            @mainWindow.contentView.addSubview(@maximizeButton)

            @mainWindow.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @maximizeButton,
                attribute: NSLayoutAttributeTop,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.contentView,
                attribute: NSLayoutAttributeTop,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @maximizeButton,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @minimizeButton,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: 10.0
            ))
        end

        def minimize(sender)
            p sender

            @mainWindow.miniaturize sender
            # TODO: set window title to songtitle
            @mainWindow.setMiniwindowTitle('Get fucked')
            # TODO: set miniwindow image?
        end

        def maximize(sender)
            p sender
            p NSScreen.mainScreen.visibleFrame

            @mainWindow.setFrame(
                NSScreen.mainScreen.visibleFrame,
                display: true,
                animate: true
            )
        end
end