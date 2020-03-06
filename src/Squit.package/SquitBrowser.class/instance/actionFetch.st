actions
actionFetch
	| workingCopy repository gitRepository remoteNames |
	self withUnitOfWork:
	[workingCopy := self projectSelection.
	repository := workingCopy repository.
	repository withUnitOfWork:
	[gitRepository := repository fsgitRepository.
	remoteNames := self chooseRemotesFrom: gitRepository.
	remoteNames ifNil: [^ self].
	remoteNames ifEmpty: [UIManager default inform: 'Nothing selected.'. ^ self].
	self withRemoteErrorHandlingDo:
		[self handlingCredentialsOf: workingCopy loadedHistorian
			do: [repository importFromAll: remoteNames]
			ifCanceled: [^ self]].
	self refresh]].