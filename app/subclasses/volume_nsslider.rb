class VolumeNSSlider < NSSlider
    # cocoa slider elements suck with mouse events:
    #  http://www.cocoabuilder.com/archive/cocoa/81675-nsslider-differentiating-mousedown-mouseup-mousedragged.html
    def mouseDown(theEvent)
        super theEvent

        moveSliderPosition
    end

    def moveSliderPosition
        NSNotificationCenter.defaultCenter.postNotificationName('volumeNsSlider:moveSliderPosition',
            object: self,
            userInfo: self.floatValue.round(2)
        )
    end
end