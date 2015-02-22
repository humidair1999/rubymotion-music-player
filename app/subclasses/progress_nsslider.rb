class ProgressNSSlider < NSSlider
    # cocoa slider elements suck with mouse events:
    #  http://www.cocoabuilder.com/archive/cocoa/81675-nsslider-differentiating-mousedown-mouseup-mousedragged.html
    def mouseDown(theEvent)
        NSNotificationCenter.defaultCenter.postNotificationName('progressNsSlider:mouseDown',
            object: self
        )

        super theEvent

        # TODO: check current event to ensure it's a mouseup?

        moveSliderPosition

        NSNotificationCenter.defaultCenter.postNotificationName('progressNsSlider:mouseUp',
            object: self
        )
    end

    def moveSliderPosition
        NSNotificationCenter.defaultCenter.postNotificationName('progressNsSlider:moveSliderPosition',
            object: self,
            userInfo: self.floatValue.round(2)
        )
    end
end