class TrackList
    def initialize
        # TODO: initialize with existing playlist (.json file?)
        @trackList = []
    end

    def addTracks
        # TODO: add actual tracks via file browser in controller
        @trackList << { filePath: 'hahaha1', length: '6:32' }
        @trackList << { filePath: 'hahaha2', length: '7:32' }
        @trackList << { filePath: 'hahaha3', length: '8:32' }
        @trackList << { filePath: 'hahaha4', length: '9:32' }
        @trackList << { filePath: 'hahaha5', length: '10:32' }
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