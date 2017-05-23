actions
actionFetch
	| repository gitRepository remoteNames |
	repository := self projectSelection repository.
	gitRepository := repository gitRepository.
	remoteNames := self chooseRemotesFrom: gitRepository.
	remoteNames ifNil: [^ self].
	remoteNames ifEmpty: [UIManager default inform: 'Nothing selected.'. ^ self].
	self handlingCredentialsOf: self projectSelection loadedHistorian
		do: [repository importFromAll: remoteNames]
		ifCanceled: [^ self].
	self refresh.