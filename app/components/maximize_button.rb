module UiComponents
    module MaximizeButton
        def MaximizeButton.create
            NSButton.alloc.initWithFrame(
                [[210, 10], [100, 22]]
            ).tap do |button|
                button.translatesAutoresizingMaskIntoConstraints = false
                button.bezelStyle = NSShadowlessSquareBezelStyle
                button.buttonType = NSMomentaryChangeButton
                button.title = 'Maximize'
                button.target = @mainWindow
                button.action = 'maximize:'
            end
        end
    end
end