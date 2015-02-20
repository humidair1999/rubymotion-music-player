class AppDelegate
    def buildWindow
        placeCloseButton
        placeMinimizeButton
        placeMaximizeButton

        placeSongSearchInput

        # @trackListCtrl = TrackListController.new(closeButton: @closeButton)
        # @transportControlsCtrl = TransportControlsController.new(scrollView: @trackListCtrl.getPlaylistElement)
    end

    private

        def placeCloseButton
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

        def placeMinimizeButton
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

        def placeMaximizeButton
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

        def placeSongSearchInput
            @mainWindow.contentView.addSubview(@songSearchInput)

            @mainWindow.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @songSearchInput,
                attribute: NSLayoutAttributeTop,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.contentView,
                attribute: NSLayoutAttributeTop,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @songSearchInput,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @maximizeButton,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: 60.0
            ))

            @mainWindow.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @songSearchInput,
                attribute: NSLayoutAttributeRight,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.contentView,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: -10.0
            ))
        end
end