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

      closeButton = NSButton.alloc.initWithFrame(
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
        button.target = window
        button.action = 'close'
      end

      minimizeButton = NSButton.alloc.initWithFrame(
        [[110, 10], [100, 22]]
      ).tap do |button|
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bezelStyle = NSShadowlessSquareBezelStyle
        button.buttonType = NSMomentaryChangeButton
        button.title = 'Minimize'
        button.target = self
        button.action = 'minimize:'
      end

      maximizeButton = NSButton.alloc.initWithFrame(
        [[210, 10], [100, 22]]
      ).tap do |button|
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bezelStyle = NSShadowlessSquareBezelStyle
        button.buttonType = NSMomentaryChangeButton
        button.title = 'Maximize'
        button.target = self
        button.action = 'maximize:'
      end

      window.contentView.addSubview(closeButton)
      window.contentView.addSubview(minimizeButton)
      window.contentView.addSubview(maximizeButton)

      window.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
        closeButton,
        attribute: NSLayoutAttributeTop,
        relatedBy: NSLayoutRelationEqual,
        toItem: window.contentView,
        attribute: NSLayoutAttributeTop,
        multiplier: 1.0,
        constant: 10.0
      ))

      window.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
        closeButton,
        attribute: NSLayoutAttributeLeft,
        relatedBy: NSLayoutRelationEqual,
        toItem: window.contentView,
        attribute: NSLayoutAttributeLeft,
        multiplier: 1.0,
        constant: 10.0
      ))

      window.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
        minimizeButton,
        attribute: NSLayoutAttributeTop,
        relatedBy: NSLayoutRelationEqual,
        toItem: window.contentView,
        attribute: NSLayoutAttributeTop,
        multiplier: 1.0,
        constant: 10.0
      ))

      window.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
        minimizeButton,
        attribute: NSLayoutAttributeLeft,
        relatedBy: NSLayoutRelationEqual,
        toItem: closeButton,
        attribute: NSLayoutAttributeRight,
        multiplier: 1.0,
        constant: 10.0
      ))

      window.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
        maximizeButton,
        attribute: NSLayoutAttributeTop,
        relatedBy: NSLayoutRelationEqual,
        toItem: window.contentView,
        attribute: NSLayoutAttributeTop,
        multiplier: 1.0,
        constant: 10.0
      ))

      window.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
        maximizeButton,
        attribute: NSLayoutAttributeLeft,
        relatedBy: NSLayoutRelationEqual,
        toItem: minimizeButton,
        attribute: NSLayoutAttributeRight,
        multiplier: 1.0,
        constant: 10.0
      ))
    end
  end

  def minimize(sender)
    p sender

    @mainWindow.miniaturize sender
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