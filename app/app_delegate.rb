class AppDelegate
    include UiComponents

    def applicationDidFinishLaunching(notification)
        # build osx menu
        buildMenu

        # create data models
        @audioManager = AudioManager.new

        # create top-level ui components
        @mainWindow = MainWindow.create

        @closeButton = CloseButton.create
        @minimizeButton = MinimizeButton.create
        @maximizeButton = MaximizeButton.create

        @songSearchInput = SongSearchInput.create

        # assemble ui components within window
        buildWindow
    end

    private

        

        def minimize(sender)
            p sender

            @mainWindow.miniaturize sender
            # TODO: set window title to songtitle
            @mainWindow.setMiniwindowTitle('Get fucked')
            # TODO: set miniwindow image?
        end

        def maximize(sender)
            p sender

            @mainWindow.setFrame(
                NSScreen.mainScreen.visibleFrame,
                display: true,
                animate: true
            )
        end
end