module UiComponents
    class SelectFolderButton
        include AppHelper

        def initialize
            @uiComponent = nil

            createUiComponent
        end

        def getUiComponent
            @uiComponent
        end

        def selectFolder(sender)
            folderChooserPanel = NSOpenPanel.openPanel.tap do |panel|
                panel.setCanChooseFiles(false)
                panel.setCanChooseDirectories(true)
                panel.setAllowsMultipleSelection(false)
                panel.setResolvesAliases(false)
                panel.setMessage("Select a directory containing your music:")

                panel.beginSheetModalForWindow(MainAppWindow.get.getUiComponent, completionHandler: lambda { |result|
                    if (result == NSFileHandlingPanelOKButton)
                        selectedDirectoryUrl = panel.URLs[0]

                        # TODO: use notification to send directory

                        # @trackList.addSongsFromDirectory(selectedDirectoryUrl)

                        # @data = @trackList.getAllTracks

                        # @tableView.reloadData
                    else
                        # TODO: some sort of error occurred?
                    end
                })
            end
        end

        private

            def createUiComponent
                @uiComponent = NSButton.alloc.initWithFrame(
                    [[10, 10], [100, 22]]
                ).tap do |button|
                    button.translatesAutoresizingMaskIntoConstraints = false
                    button.bezelStyle = NSShadowlessSquareBezelStyle
                    button.buttonType = NSMomentaryChangeButton
                    button.title = 'Select folder'
                    # button.bordered = true
                    # button.image = NSImage.imageNamed('img/circle')
                    # p button.image
                    # button.imagePosition = NSImageOnly
                    button.target = self
                    button.action = 'selectFolder:'
                end
            end
    end
end