running
runNextOperation
	self operations ifEmpty: [self done. ^ false].
	^ self handleOperationResult: self nextOperation run