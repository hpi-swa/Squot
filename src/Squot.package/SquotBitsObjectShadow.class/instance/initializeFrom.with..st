initialize-release
initializeFrom: aBitsObject with: aContentCapturer
	self flag: #deprecated. "Ask the mirror instead."
	value := aBitsObject copy.