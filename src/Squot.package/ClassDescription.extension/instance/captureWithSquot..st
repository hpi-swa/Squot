*Squot-trackable
captureWithSquot: aCapturer
	self deprecated: 'Ask the mirror instead'.
	self isMeta ifTrue: [^ super captureWithSquot: aCapturer].
	^ aCapturer shadowOf: self ifAbsentPut: [self captureWithSquot]