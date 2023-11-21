moving
moveTo: aPath in: aWorkingCopy
	aPath = self path ifTrue: [^ self].
	(aWorkingCopy isUnmappedPath: aPath) ifFalse: [^ self error: 'Cannot move to a path that is already taken'].
	self uncheckedMoveTo: aPath in: aWorkingCopy.