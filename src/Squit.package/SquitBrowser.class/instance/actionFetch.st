actions
actionFetch
	| workingCopy repository gitRepository remoteNames |
	workingCopy := self projectSelection.
	repository := workingCopy repository.
	gitRepository := repository gitRepository.
	remoteNames := self chooseRemotesFrom: gitRepository.
	remoteNames ifNil: [^ self].
	remoteNames ifEmpty: [UIManager default inform: 'Nothing selected.'. ^ self].
	self handlingCredentialsOf: workingCopy loadedHistorian
		do: [repository importFromAll: remoteNames]
		ifCanceled: [^ self].
	self refresh.