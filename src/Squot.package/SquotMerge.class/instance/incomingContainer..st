initialize-release
incomingContainer: anObjectContainer
	incomingContainer := anObjectContainer.
	patchBuilder ifNil: [self error: 'Set workingCopy first'].
	patchBuilder goingTo: anObjectContainer.