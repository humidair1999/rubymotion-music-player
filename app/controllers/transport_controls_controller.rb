# TODO: probably should be an instance of NSViewController?
class TransportControlsController
    include AppHelper

    def initialize(opts)
        p opts[:scrollView]
    end
end