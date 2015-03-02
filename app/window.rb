class AppDelegate
    def buildWindow
        placeCloseButton
        placeMinimizeButton
        placeMaximizeButton

        placePlayButton

        placeSongSearchInput

        placeSelectFolderButton

        placeSongListTable

        placeCurrentTimeText
        placeProgressBar
        placeTotalDurationText

        placeVolumeBar
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
                attribute: NSLayoutAttributeBottom,
                relatedBy: NSLayoutRelationEqual,
                toItem: @closeButton.getUiComponent,
                attribute: NSLayoutAttributeTop,
                multiplier: 1.0,
                constant: 16.0
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

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @closeButton.getUiComponent,
                attribute: NSLayoutAttributeRight,
                relatedBy: NSLayoutRelationEqual,
                toItem: @closeButton.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                multiplier: 1.0,
                constant: 16.0
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
                attribute: NSLayoutAttributeBottom,
                relatedBy: NSLayoutRelationEqual,
                toItem: @minimizeButton.getUiComponent,
                attribute: NSLayoutAttributeTop,
                multiplier: 1.0,
                constant: 16.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @minimizeButton.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @closeButton.getUiComponent,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: 4.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @minimizeButton.getUiComponent,
                attribute: NSLayoutAttributeRight,
                relatedBy: NSLayoutRelationEqual,
                toItem: @minimizeButton.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                multiplier: 1.0,
                constant: 16.0
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
                attribute: NSLayoutAttributeBottom,
                relatedBy: NSLayoutRelationEqual,
                toItem: @maximizeButton.getUiComponent,
                attribute: NSLayoutAttributeTop,
                multiplier: 1.0,
                constant: 16.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @maximizeButton.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @minimizeButton.getUiComponent,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: 4.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @maximizeButton.getUiComponent,
                attribute: NSLayoutAttributeRight,
                relatedBy: NSLayoutRelationEqual,
                toItem: @maximizeButton.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                multiplier: 1.0,
                constant: 16.0
            ))
        end

        def placePlayButton
            @mainWindow.getUiComponent.contentView.addSubview(@playButton.getUiComponent)

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @playButton.getUiComponent,
                attribute: NSLayoutAttributeTop,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.getUiComponent.contentView,
                attribute: NSLayoutAttributeTop,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @playButton.getUiComponent,
                attribute: NSLayoutAttributeBottom,
                relatedBy: NSLayoutRelationEqual,
                toItem: @playButton.getUiComponent,
                attribute: NSLayoutAttributeTop,
                multiplier: 1.0,
                constant: 16.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @playButton.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @maximizeButton.getUiComponent,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: 100.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @playButton.getUiComponent,
                attribute: NSLayoutAttributeRight,
                relatedBy: NSLayoutRelationEqual,
                toItem: @playButton.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                multiplier: 1.0,
                constant: 16.0
            ))
        end

        def placeSongSearchInput
            @mainWindow.getUiComponent.contentView.addSubview(@songSearchInput.getUiComponent)

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @songSearchInput.getUiComponent,
                attribute: NSLayoutAttributeTop,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.getUiComponent.contentView,
                attribute: NSLayoutAttributeTop,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @songSearchInput.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @playButton.getUiComponent,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: 60.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @songSearchInput.getUiComponent,
                attribute: NSLayoutAttributeRight,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.getUiComponent.contentView,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: -10.0
            ))
        end

        def placeSelectFolderButton
            @mainWindow.getUiComponent.contentView.addSubview(@selectFolderButton.getUiComponent)

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @selectFolderButton.getUiComponent,
                attribute: NSLayoutAttributeBottom,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.getUiComponent.contentView,
                attribute: NSLayoutAttributeBottom,
                multiplier: 1.0,
                constant: -10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @selectFolderButton.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.getUiComponent.contentView,
                attribute: NSLayoutAttributeLeft,
                multiplier: 1.0,
                constant: 10.0
            ))
        end

        def placeSongListTable
            @mainWindow.getUiComponent.contentView.addSubview(@songListTable.getUiComponent)

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @songListTable.getUiComponent,
                attribute: NSLayoutAttributeTop,
                relatedBy: NSLayoutRelationEqual,
                toItem: @closeButton.getUiComponent,
                attribute: NSLayoutAttributeBottom,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @songListTable.getUiComponent,
                attribute: NSLayoutAttributeBottom,
                relatedBy: NSLayoutRelationEqual,
                toItem: @selectFolderButton.getUiComponent,
                attribute: NSLayoutAttributeTop,
                multiplier: 1.0,
                constant: -10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @songListTable.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.getUiComponent.contentView,
                attribute: NSLayoutAttributeLeft,
                multiplier: 1.0,
                constant: 0.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @songListTable.getUiComponent,
                attribute: NSLayoutAttributeRight,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.getUiComponent.contentView,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: 0.0
            ))
        end

        def placeCurrentTimeText
            @mainWindow.getUiComponent.contentView.addSubview(@currentTimeText.getUiComponent)

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @currentTimeText.getUiComponent,
                attribute: NSLayoutAttributeTop,
                relatedBy: NSLayoutRelationEqual,
                toItem: @songListTable.getUiComponent,
                attribute: NSLayoutAttributeBottom,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @currentTimeText.getUiComponent,
                attribute: NSLayoutAttributeBottom,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.getUiComponent.contentView,
                attribute: NSLayoutAttributeBottom,
                multiplier: 1.0,
                constant: -10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @currentTimeText.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @selectFolderButton.getUiComponent,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @currentTimeText.getUiComponent,
                attribute: NSLayoutAttributeRight,
                relatedBy: NSLayoutRelationEqual,
                toItem: @currentTimeText.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                multiplier: 1.0,
                constant: 60.0
            ))
        end

        def placeProgressBar
            @mainWindow.getUiComponent.contentView.addSubview(@progressBar.getUiComponent)

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @progressBar.getUiComponent,
                attribute: NSLayoutAttributeTop,
                relatedBy: NSLayoutRelationEqual,
                toItem: @songListTable.getUiComponent,
                attribute: NSLayoutAttributeBottom,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @progressBar.getUiComponent,
                attribute: NSLayoutAttributeBottom,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.getUiComponent.contentView,
                attribute: NSLayoutAttributeBottom,
                multiplier: 1.0,
                constant: -10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @progressBar.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @currentTimeText.getUiComponent,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @progressBar.getUiComponent,
                attribute: NSLayoutAttributeRight,
                relatedBy: NSLayoutRelationEqual,
                toItem: @progressBar.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                multiplier: 1.0,
                constant: 250.0
            ))
        end

        def placeTotalDurationText
            @mainWindow.getUiComponent.contentView.addSubview(@totalDurationText.getUiComponent)

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @totalDurationText.getUiComponent,
                attribute: NSLayoutAttributeTop,
                relatedBy: NSLayoutRelationEqual,
                toItem: @songListTable.getUiComponent,
                attribute: NSLayoutAttributeBottom,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @totalDurationText.getUiComponent,
                attribute: NSLayoutAttributeBottom,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.getUiComponent.contentView,
                attribute: NSLayoutAttributeBottom,
                multiplier: 1.0,
                constant: -10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @totalDurationText.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @progressBar.getUiComponent,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @totalDurationText.getUiComponent,
                attribute: NSLayoutAttributeRight,
                relatedBy: NSLayoutRelationEqual,
                toItem: @totalDurationText.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                multiplier: 1.0,
                constant: 60.0
            ))
        end

        def placeVolumeBar
            @mainWindow.getUiComponent.contentView.addSubview(@volumeBar.getUiComponent)

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @volumeBar.getUiComponent,
                attribute: NSLayoutAttributeTop,
                relatedBy: NSLayoutRelationEqual,
                toItem: @songListTable.getUiComponent,
                attribute: NSLayoutAttributeBottom,
                multiplier: 1.0,
                constant: 10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @volumeBar.getUiComponent,
                attribute: NSLayoutAttributeBottom,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.getUiComponent.contentView,
                attribute: NSLayoutAttributeBottom,
                multiplier: 1.0,
                constant: -10.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @volumeBar.getUiComponent,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: @volumeBar.getUiComponent,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: -100.0
            ))

            @mainWindow.getUiComponent.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @volumeBar.getUiComponent,
                attribute: NSLayoutAttributeRight,
                relatedBy: NSLayoutRelationEqual,
                toItem: @mainWindow.getUiComponent.contentView,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: -10.0
            ))
        end
end