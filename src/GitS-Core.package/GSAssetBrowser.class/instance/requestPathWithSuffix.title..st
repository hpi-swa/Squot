requests
requestPathWithSuffix: aStringOrPath title: aString
	^ self activeWorkingCopy
		requestUnmappedPathWithTitle: aString
		initialAnswer: (self initialPathRequestAnswerWithSuffix: aStringOrPath)