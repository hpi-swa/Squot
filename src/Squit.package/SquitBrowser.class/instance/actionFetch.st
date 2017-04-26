actions
actionFetch
	| gitRepository remoteNames |
	gitRepository := self projectSelection repository gitRepository.
	remoteNames := self chooseRemotesFrom: gitRepository.
	remoteNames ifNil: [^ self].
	remoteNames ifEmpty: [UIManager default inform: 'Nothing selected.'. ^ self].
	gitRepository fetchFromAll: remoteNames.
	self refresh.