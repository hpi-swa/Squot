ui
ifRepositoryDoesNotExist: aBlock
	^ (self activeWorkingCopy ifNil: [^ self]) ifRepositoryDoesNotExist: aBlock