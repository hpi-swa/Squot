*Squot-trackable
captureWithSquot: aCapturer
	^ aCapturer shadowOf: self ifAbsentPut: [self captureWithSquot]