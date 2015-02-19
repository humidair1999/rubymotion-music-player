class CustomNSWindow < NSWindow
    def canBecomeKeyWindow
        true
    end

    def canBecomeMainWindow
        true
    end

    def acceptsFirstResponder
        true
    end

    def becomeFirstResponder
        true
    end

    def resignFirstResponder
        true
    end

    # TODO: should probably figure out how to set these programmatically,
    #  rather than hard-code

    def isMainWindow
        true
    end

    def isKeyWindow
        true
    end
end