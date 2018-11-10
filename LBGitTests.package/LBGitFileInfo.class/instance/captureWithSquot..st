as yet unclassified
captureWithSquot: aCapturer

	^ aCapturer shadowOf: self ifAbsentPut: [self captureWithSquot]