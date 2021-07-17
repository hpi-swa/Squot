initialize-release
initializeFrom: aPrimitiveObject with: aContentCapturer
	self flag: #deprecated. "Ask the mirror instead."
	value := aPrimitiveObject.