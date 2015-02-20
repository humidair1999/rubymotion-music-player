module AppHelper
    def currentApp
        NSApp.delegate
    end

    # TODO: better way to determine if window is main window
    def mainWindow
        NSApp.windows.each do |window|
            return window if window.instance_of?(CustomNSWindow)
        end
    end
end