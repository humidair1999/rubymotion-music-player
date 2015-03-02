class AppDelegate
    include UiComponents

    def applicationDidFinishLaunching(notification)
        # build osx menu
        buildMenu

        # create data models
        @trackList = TrackList.new
        @audioManager = AudioManager.new

        # create top-level ui components
        @mainWindow = MainWindow.new

        @closeButton = CloseButton.new
        @minimizeButton = MinimizeButton.new
        @maximizeButton = MaximizeButton.new

        @playButton = PlayButton.new

        @songSearchInput = SongSearchInput.new

        @selectFolderButton = SelectFolderButton.new

        # more complex components with children
        @songListTable = SongListTable.new(@trackList)

        # transport controls
        @currentTimeText = CurrentTimeText.new
        @progressBar = ProgressBar.new
        @totalDurationText = TotalDurationText.new

        @volumeBar = VolumeBar.new

        # assemble ui components within window
        buildWindow
    end
end