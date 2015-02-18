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
      window.setBackgroundColor(NSColor.colorWithCalibratedRed(52.0/255.0, green: 152.0/255.0, blue: 219.0/255.0, alpha: 255.0/255.0))
      # window.setOpaque(false)
      window.orderFrontRegardless

      closeButton = NSButton.alloc.initWithFrame(
        [[10, 10], [100, 22]]
      ).tap do |button|
        button.title = 'Close'
        button.bezelStyle = NSTexturedRoundedBezelStyle
        button.target = window
        button.action = 'close'
      end

      window.contentView.addSubview(closeButton)
    end
  end
end
