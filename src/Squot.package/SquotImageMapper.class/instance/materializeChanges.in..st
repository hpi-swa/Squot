changes-operations
materializeChanges: aCollection in: aWorkingCopy
	aCollection size > 1 ifTrue: [self error: 'attempting to materialize multiple image changes at once'].
	aCollection isEmpty ifTrue: [^ self].
	aWorkingCopy materializedAt: self path put: aCollection first value.