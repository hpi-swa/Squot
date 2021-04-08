*Squot-trackable-capturing
captureWithSquot: anObjectCapturer
	"Symbols can be treated like numbers: each is trivially available everywhere."
	self flag: #deprecated. "Ask the mirror instead."
	^ anObjectCapturer capturePrimitiveValue: self