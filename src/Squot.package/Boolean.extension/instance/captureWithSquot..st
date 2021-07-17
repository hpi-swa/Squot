*Squot-trackable
captureWithSquot: anObjectCapturer
	self flag: #deprecated. "Ask the mirror instead."
	^ anObjectCapturer capturePrimitiveValue: self