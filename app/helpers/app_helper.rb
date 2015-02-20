module AppHelper
    # def currentApp
    #     NSApp.delegate
    # end

    module MainAppWindow
        def MainAppWindow.set(window)
            @mainAppWindow = window
        end

        def MainAppWindow.get
            p @mainAppWindow

            @mainAppWindow
        end
    end

    # TODO: better way to determine if window is main window
    # def mainWindow
    #     NSApp.windows.each do |window|
    #         return window if window.instance_of?(CustomNSWindow)
    #     end
    # end
end