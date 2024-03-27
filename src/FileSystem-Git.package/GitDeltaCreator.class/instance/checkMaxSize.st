as yet unclassified
checkMaxSize
	(self hasMaxSize and: [self output size >= self maxSize])
		ifTrue: [self output: nil].