class AppDelegate
    include UiComponents

    def applicationDidFinishLaunching(notification)
        # build osx menu
        buildMenu

        # create data models
        @audioManager = AudioManager.new

        # create top-level ui components
        @mainWindow = MainWindow.new

        @closeButton = CloseButton.new
        @minimizeButton = MinimizeButton.new
        @maximizeButton = MaximizeButton.new

        @songSearchInput = SongSearchInput.new

        # assemble ui components within window
        buildWindow
    end
end