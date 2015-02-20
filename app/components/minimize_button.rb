module UiComponents
    module MinimizeButton
        def MinimizeButton.create
            NSButton.alloc.initWithFrame(
                [[110, 10], [100, 22]]
            ).tap do |button|
                button.translatesAutoresizingMaskIntoConstraints = false
                button.bezelStyle = NSShadowlessSquareBezelStyle
                button.buttonType = NSMomentaryChangeButton
                button.title = 'Minimize'
                button.target = @mainWindow
                button.action = 'minimize:'
            end
        end
    end
end