changes-operations
materializeChanges: aCollection in: aWorkingCopy
	aCollection size = 1 ifFalse: [self error: 'attempting to materialize multiple image changes at once'].
	aWorkingCopy materializedAt: self path put: aCollection first value.