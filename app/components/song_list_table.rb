module UiComponents
    class SongListTable
        include AppHelper

        def initialize(songList)
            @uiComponent = nil

            @trackList = WeakRef.new(songList)
            @data = @trackList.getAllTracks

            createUiComponent
            buildTableView

            attachSubscribers
        end

        def attachSubscribers
            NSNotificationCenter.defaultCenter.addObserver(self,
                  selector: 'refreshData',
                  name: 'trackList:addTracks',
                  object: nil
            )

            NSNotificationCenter.defaultCenter.addObserver(self,
                  selector: 'filterSongs:',
                  name: 'songSearchInput:controlTextDidChange',
                  object: nil
            )
        end

        def getUiComponent
            @uiComponent
        end

        def refreshData
            @data = @trackList.getAllTracks

            @tableView.reloadData
        end

        def filterSongs(sender)
            searchQuery = sender.userInfo

            @data = @trackList.filterByFilePath(searchQuery)

            @tableView.reloadData
        end

        def doubleClickColumn(sender)
            p 'click song'

            if sender.clickedRow > -1
                trackId = @data[sender.clickedRow][:id]

                p trackId

                trackInfo = @trackList.findTrackById(trackId)

                p trackInfo

                NSNotificationCenter.defaultCenter.postNotificationName('songListTable:playNewSong',
                    object: self,
                    userInfo: trackInfo
                )
            end
        end

        private

            def createUiComponent
                @uiComponent = NSScrollView.alloc.initWithFrame(
                    [[0, 0], [480, 322]]
                ).tap do |scrollView|
                    scrollView.translatesAutoresizingMaskIntoConstraints = false
                    scrollView.hasVerticalScroller = true
                end
            end

            def buildTableView
                @tableView = NSTableView.alloc.init.tap do |table|
                    table.delegate = self
                    table.dataSource = self
                    table.autoresizingMask = NSViewMinXMargin|NSViewMaxXMargin|NSViewMinYMargin|NSViewMaxYMargin
                    table.target = self
                    table.doubleAction = "doubleClickColumn:"
                    table.allowsColumnReordering = false
                    table.columnAutoresizingStyle = NSTableViewReverseSequentialColumnAutoresizingStyle
                    # table.usesAlternatingRowBackgroundColors = true
                    table.backgroundColor = NSColor.colorWithCalibratedRed(28.0/255.0, green: 42.0/255.0, blue: 57.0/255.0, alpha: 255.0/255.0)
                    table.rowHeight = 18.0
                end

                columnIsPlaying = NSTableColumn.alloc.initWithIdentifier("isPlaying").tap do |column|
                    column.editable = false
                    column.resizingMask = NSTableColumnAutoresizingMask
                    column.headerCell.setTitle("Playing")
                    column.maxWidth = 50
                end

                columnFilePath = NSTableColumn.alloc.initWithIdentifier("filePath").tap do |column|
                    column.editable = false
                    column.resizingMask = NSTableColumnAutoresizingMask
                    column.headerCell.setTitle("File Path")
                    column.width = 500

                    filePathSortDescriptor = NSSortDescriptor.sortDescriptorWithKey(
                        column.identifier,
                        ascending: true,
                        selector: 'compare:'
                    )

                    column.setSortDescriptorPrototype(filePathSortDescriptor)
                end

                columnDate = NSTableColumn.alloc.initWithIdentifier("length").tap do |column|
                    column.editable = false
                    column.resizingMask = NSTableColumnAutoresizingMask
                    column.headerCell.setTitle("Length")
                    column.maxWidth = 80

                    lengthSortDescriptor = NSSortDescriptor.sortDescriptorWithKey(
                        column.identifier,
                        ascending: true,
                        selector: 'compare:'
                    )

                    column.setSortDescriptorPrototype(lengthSortDescriptor)
                end

                @tableView.addTableColumn(columnIsPlaying)
                @tableView.addTableColumn(columnFilePath)
                @tableView.addTableColumn(columnDate)

                getUiComponent.setDocumentView(@tableView)
            end

            def tableView(aTableView, sortDescriptorsDidChange: oldDescriptors)
                if sortDescriptor = aTableView.sortDescriptors[0]
                    @data = @trackList.sort(sortDescriptor.key.to_sym, sortDescriptor.ascending)

                    aTableView.reloadData
                end
            end

            def tableView(aTableView, viewForTableColumn: aTableColumn, row: aRow)
                # Get an existing cell with the MyView identifier if it exists
                result = aTableView.makeViewWithIdentifier("SongListCellView", owner: self)

                # p aTableColumn.identifier
                # p aRow

                # There is no existing cell to reuse so create a new one
                if (result.nil?)
                    # Create the new NSTextField with a frame of the {0,0} with the width of the table.
                    # Note that the height of the frame is not really relevant, because the row height will modify the height.
                    result = NSTextField.alloc.initWithFrame(
                        [[0, 100], [0, 100]]
                    ).tap do |textField|
                        textField.setSelectable(false)
                        textField.setBezeled(false)
                        textField.setDrawsBackground(false)
                        textField.setBordered(false)

                        textField.setTextColor(NSColor.colorWithCalibratedRed(188.0/255.0, green: 202.0/255.0, blue: 217.0/255.0, alpha: 255.0/255.0))
                    end

                    # The identifier of the NSTextField instance is set to MyView.
                    # This allows the cell to be reused.
                    result.identifier = "SongListCellView"
                end

                # result is now guaranteed to be valid, either as a reused cell
                # or as a new cell, so set the stringValue of the cell to the
                # data value at aRow
                result.stringValue = @data[aRow]

                # Return the result
                return result
            end

            def tableView(aTableView, didAddRowView: rowView, forRow: row)
                if (row % 2 == 0)
                    rowView.backgroundColor = NSColor.colorWithCalibratedRed(28.0/255.0, green: 42.0/255.0, blue: 57.0/255.0, alpha: 255.0/255.0)
                else
                    rowView.backgroundColor = NSColor.colorWithCalibratedRed(44.0/255.0, green: 58.0/255.0, blue: 73.0/255.0, alpha: 255.0/255.0)
                end
            end

            def numberOfRowsInTableView(aTableView)
                @data.size
            end

            def tableView(aTableView, objectValueForTableColumn: aTableColumn, row: rowIndex)
                # p aTableColumn

                case aTableColumn.identifier
                    when 'isPlaying'
                        @data[rowIndex][:isPlaying]
                    when 'filePath'
                        @data[rowIndex][:filePath]
                    when 'length'
                        @data[rowIndex][:length]
                end
            end
    end
end