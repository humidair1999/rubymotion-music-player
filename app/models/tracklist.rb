# TODO: need to store backup and modified track listings in here to allow sorting
#  and filtering to work correctly with isPlaying column

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

        NSNotificationCenter.defaultCenter.addObserver(self,
              selector: 'updateIsPlaying:',
              name: 'audioManager:stop',
              object: nil
        )

        NSNotificationCenter.defaultCenter.addObserver(self,
              selector: 'updateIsPlaying:',
              name: 'audioManager:play',
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
        # p @trackList

        @trackList
    end

    def findTrackById(id)
        getAllTracks.find {|track| track[:id] == id }
    end

    def getTrackIndexById(id)
        trackArray = getAllTracks

        # http://stackoverflow.com/questions/6242311/quickly-get-index-of-array-element-in-ruby
        trackHash = Hash[trackArray.map.with_index.to_a]

        trackRowIndex = trackHash.select { |track| track[:id] == id }.invert.keys.first

        trackRowIndex
    end

    def updateIsPlaying(sender)
        trackId = sender.userInfo[:trackId]
        track = findTrackById(trackId)

        track[:isPlaying] = !track[:isPlaying]

        NSNotificationCenter.defaultCenter.postNotificationName('trackList:updateTrackInfo',
            object: self,
            userInfo: {
                trackRowIndex: getTrackIndexById(trackId)
            }
        )
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

                    tracks << {
                        filePath: filePathPointer[0],
                        # TODO: show actual song lengths
                        length: '1:00',
                        isPlaying: false,
                        id: [*('a'..'z'),*('0'..'9')].shuffle[0,25].join
                    }
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