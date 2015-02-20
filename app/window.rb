class AppDelegate
    def buildWindow
        placeCloseButton
        placeMinimizeButton
        placeMaximizeButton

        # placeSongSearchInput

        # @trackListCtrl = TrackListController.new(closeButton: @closeButton)
        # @transportControlsCtrl = TransportControlsController.new(scrollView: @trackListCtrl.getPlaylistElement)
    end

    private

        def placeCloseButton
            @mainWindow.getUiComponent.contentView.addSubview(@closeButton.getUiComponent)

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @closeButton.getUiComponent,
                attribute: NSLayoutAttributeTop,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.getUiComponent.contentView,
                attribute: NSLayoutAttributeTop,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @closeButton.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.getUiComponent.contentView,
                attribute: NSLayoutAttributeLeft,
                multiplier: 1.0,
                constant: 10.0
            ))
        end

        def placeMinimizeButton
            @mainWindow.getUiComponent.contentView.addSubview(@minimizeButton.getUiComponent)

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @minimizeButton.getUiComponent,
                attribute: NSLayoutAttributeTop,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.getUiComponent.contentView,
                attribute: NSLayoutAttributeTop,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @minimizeButton.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @closeButton.getUiComponent,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: 10.0
            ))
        end

        def placeMaximizeButton
            @mainWindow.getUiComponent.contentView.addSubview(@maximizeButton.getUiComponent)

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @maximizeButton.getUiComponent,
                attribute: NSLayoutAttributeTop,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.getUiComponent.contentView,
                attribute: NSLayoutAttributeTop,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @maximizeButton.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @minimizeButton.getUiComponent,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: 10.0
            ))
        end

        # def placeSongSearchInput
        #     @mainWindow.contentView.addSubview(@songSearchInput)

        #     @mainWindow.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
        #         @songSearchInput,
        #         attribute: NSLayoutAttributeTop,
        #         relatedBy: NSLayoutRelationEqual,
        #         toItem: @mainWindow.contentView,
        #         attribute: NSLayoutAttributeTop,
        #         multiplier: 1.0,
        #         constant: 10.0
        #     ))

        #     @mainWindow.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
        #         @songSearchInput,
        #         attribute: NSLayoutAttributeLeft,
        #         relatedBy: NSLayoutRelationEqual,
        #         toItem: @maximizeButton,
        #         attribute: NSLayoutAttributeRight,
        #         multiplier: 1.0,
        #         constant: 60.0
        #     ))

        #     @mainWindow.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
        #         @songSearchInput,
        #         attribute: NSLayoutAttributeRight,
        #         relatedBy: NSLayoutRelationEqual,
        #         toItem: @mainWindow.contentView,
        #         attribute: NSLayoutAttributeRight,
        #         multiplier: 1.0,
        #         constant: -10.0
        #     ))
        # end
end