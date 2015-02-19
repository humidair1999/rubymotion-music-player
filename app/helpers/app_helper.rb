module AppHelper
    def current_app
        NSApp.delegate
    end

    # TODO: better way to determine if window is main window
    def main_window
        NSApp.windows.each do |window|
            return window if window.instance_of?(CustomNSWindow)
        end
    end
end