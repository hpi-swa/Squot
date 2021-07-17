*Squot-trackable
captureWithSquot: aCapturer
	self flag: #deprecated. "Ask the mirror instead."
	^ aCapturer shadowOf: self ifAbsentPut: [self captureWithSquot]