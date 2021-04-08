converting
captureWithSquot: aCapturer
	self flag: #deprecated. "Ask the mirror instead."
	Warning signal: 'About to capture a SquotObjectGraph, which should not be done.'.
	^ super captureWithSquot: aCapturer