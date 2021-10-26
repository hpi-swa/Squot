initialize-release
initializeFrom: anObject with: aCapturer
	self flag: #deprecated. "Ask the mirror instead."
	originalClass := anObject class.
	capturedClass := anObject class.
	anObject squotCaptureSlotsIn: self with: aCapturer.