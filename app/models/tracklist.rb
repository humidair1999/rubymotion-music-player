class TrackList
    def initialize
        @fileManager = NSFileManager.alloc.init

        # TODO: initialize with existing playlist (.json file?)
        @trackList = []

        attachSubscribers
    end

    def attachSubscribers
        NSNotificationCenter.defaultCenter.addObserver(self,
              selector: 'addSongsFromDirectory:',
              name: 'selectFolderButton:selectFolder',
              object: nil
        )
    end

    def addTracks(newTracks)
        @trackList = newTracks

        NSNotificationCenter.defaultCenter.postNotificationName('trackList:addTracks',
            object: self
        )
    end

    def getAllTracks
        p @trackList

        @trackList
    end

    def addSongsFromDirectory(sender)
        url = sender.userInfo

        directoryEnumerator = createEnumeratorAtUrl(url)

        newTracks = retrieveValidTracksFromEnumerator(directoryEnumerator)

        addTracks(newTracks) if newTracks.size
    end

    def createEnumeratorAtUrl(url)
        dirEnumerator = @fileManager.enumeratorAtURL(url,
            # TODO: do I need any keys prefetched?
            includingPropertiesForKeys: nil,
            options: NSDirectoryEnumerationSkipsPackageDescendants|NSDirectoryEnumerationSkipsHiddenFiles,
            # TODO: how to properly handle errors?
            errorHandler: lambda { |url, error|
                true
            }.weak!)

        dirEnumerator
    end

    def retrieveValidTracksFromEnumerator(directoryEnumerator)
        tracks = []

        directoryEnumerator.each do |url|
            isDirectoryPointer = Pointer.new(:object)
            # TODO: add some error handling
            url.getResourceValue(isDirectoryPointer, forKey: NSURLIsDirectoryKey, error: nil)

            if !isDirectoryPointer[0]
                if ['mp3', 'm4a'].include?(url.pathExtension)
                    filePathPointer = Pointer.new(:object)
                    # TODO: add some error handling
                    url.getResourceValue(filePathPointer, forKey: NSURLPathKey, error: nil)

                    tracks << { filePath: filePathPointer[0], length: '1:00' }
                end
            end
        end

        tracks
    end

    def filterByFilePath(searchQuery)
        # TODO: move to something cleaner/more performant?
        getAllTracks.select {|track| track[:filePath].downcase.include?(searchQuery.downcase) }
    end

    def sort(key, isAscending)
        sortedTracks = getAllTracks.sort_by{ |item| item[key.to_sym].downcase }

        isAscending ? sortedTracks : sortedTracks.reverse
    end
end