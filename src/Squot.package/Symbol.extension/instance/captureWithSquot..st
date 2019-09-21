*Squot-trackable-capturing
captureWithSquot: anObjectCapturer
	"Symbols can be treated like numbers: each is trivially available everywhere."
	^ anObjectCapturer capturePrimitiveValue: self