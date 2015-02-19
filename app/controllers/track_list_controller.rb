class TrackListController
    include AppHelper

    def initialize(opts)
        p opts

        @closeButton = opts[:closeButton]

        renderScrollView
        renderTableView
    end

    private

        def renderScrollView
            @scrollView = NSScrollView.alloc.initWithFrame(
                [[0, 0], [480, 322]]
            ).tap do |scrollView|
                scrollView.translatesAutoresizingMaskIntoConstraints = false
                # scrollView.autoresizingMask = NSViewMinXMargin|NSViewMinYMargin|NSViewWidthSizable|NSViewHeightSizable
                scrollView.hasVerticalScroller = true
            end

            main_window.contentView.addSubview(@scrollView)

            main_window.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @scrollView,
                attribute: NSLayoutAttributeTop,
                relatedBy: NSLayoutRelationEqual,
                toItem: @closeButton,
                attribute: NSLayoutAttributeBottom,
                multiplier: 1.0,
                constant: 10.0
            ))

            main_window.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @scrollView,
                attribute: NSLayoutAttributeBottom,
                relatedBy: NSLayoutRelationEqual,
                toItem: main_window.contentView,
                attribute: NSLayoutAttributeBottom,
                multiplier: 1.0,
                constant: 0.0
            ))

            main_window.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @scrollView,
                attribute: NSLayoutAttributeLeft,
                relatedBy: NSLayoutRelationEqual,
                toItem: main_window.contentView,
                attribute: NSLayoutAttributeLeft,
                multiplier: 1.0,
                constant: 0.0
            ))

            main_window.contentView.addConstraint(NSLayoutConstraint.constraintWithItem(
                @scrollView,
                attribute: NSLayoutAttributeRight,
                relatedBy: NSLayoutRelationEqual,
                toItem: main_window.contentView,
                attribute: NSLayoutAttributeRight,
                multiplier: 1.0,
                constant: 0.0
            ))
        end

        def renderTableView
            @tableView = NSTableView.alloc.init

            columnFilePath = NSTableColumn.alloc.initWithIdentifier("filePath")
            columnFilePath.editable = false
            columnFilePath.headerCell.setTitle("File Path")
            columnFilePath.width = 400
            @tableView.addTableColumn(columnFilePath)

            columnDate = NSTableColumn.alloc.initWithIdentifier("length")
            columnDate.editable = false
            columnDate.headerCell.setTitle("Length")
            columnDate.width = 400
            @tableView.addTableColumn(columnDate)

            @tableView.delegate = self
            @tableView.dataSource = self
            @tableView.autoresizingMask = NSViewMinXMargin|NSViewMaxXMargin|NSViewMinYMargin|NSViewMaxYMargin
            @tableView.target = self
            @tableView.doubleAction = :"doubleClickColumn:"

            @scrollView.setDocumentView(@tableView)
        end
end