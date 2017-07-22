initialize-release
initializeFrom: anObject with: aCapturer
	originalClass := anObject class.
	capturedClass := anObject class.
	anObject squotCaptureSlotsIn: self with: aCapturer.