class TrackList
    def initialize
        @fileManager = NSFileManager.alloc.init

        p @fileManager

        # TODO: initialize with existing playlist (.json file?)
        @trackList = []
    end

    def findSongsInDirectory(url)
        newTracks = []

        dirEnumerator = @fileManager.enumeratorAtURL(url,
            # TODO: do I need any keys prefetched?
            includingPropertiesForKeys: nil,
            options: NSDirectoryEnumerationSkipsHiddenFiles,
            # TODO: how to properly handle errors?
            errorHandler: lambda { |url, error|
                true
            })

        dirEnumerator.each do |url|
            p url

            fileName = Pointer.new(:object)

            url.getResourceValue(fileName, forKey: NSURLPathKey, error: nil)

            p fileName[0]

            newTracks << { filePath: fileName[0], length: '1:00' }
        end

        p newTracks

        addTracks(newTracks)

        # errorPointer = Pointer.new(:object)

        # subDirectories = @fileManager.subpathsOfDirectoryAtPath(path, error: errorPointer)

        # unless subDirectories
        #     p errorPointer[0]
        # end

        # p subDirectories

        # subDirectories.each do |filePath|
        #     @trackList << { filePath: filePath, length: '1:00' }
        # end
    end

    def addTracks(newTracks)
        @trackList = newTracks
    end

    def getAllTracks
        p @trackList

        @trackList
    end

    def filterByFilePath(searchQuery)
        # TODO: move to something cleaner/more performant?
        getAllTracks.select {|track| track[:filePath].downcase.include?(searchQuery.downcase) }
    end

    def sort(key, isAscending)
        sortedTracks = getAllTracks.sort_by{ |item| item[key.to_sym] }

        isAscending ? sortedTracks : sortedTracks.reverse
    end
end