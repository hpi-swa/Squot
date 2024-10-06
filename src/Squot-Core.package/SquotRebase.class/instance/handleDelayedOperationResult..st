running
handleDelayedOperationResult: anObject
	(self handleOperationResult: anObject)
		ifTrue: [self run].