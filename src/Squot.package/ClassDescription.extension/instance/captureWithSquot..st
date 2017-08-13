*Squot-trackable
captureWithSquot: aCapturer
	self isMeta ifTrue: [^ super captureWithSquot: aCapturer].
	^ aCapturer shadowOf: self ifAbsentPut: [self captureWithSquot]