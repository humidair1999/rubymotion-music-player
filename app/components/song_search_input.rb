module UiComponents
    module SongSearchInput
        def SongSearchInput.create
            NSTextField.alloc.initWithFrame(
                [[210, 10], [100, 22]]
            ).tap do |textInput|
                textInput.translatesAutoresizingMaskIntoConstraints = false
                textInput.setEditable(true)
                textInput.setDelegate(self)
            end
        end

        def SongSearchInput.controlTextDidChange(notification)
            p notification.object.stringValue

            # TODO: use notification instead of direct manipulation

            # @trackListCtrl.filterSongs(notification.object.stringValue)
        end
    end
end