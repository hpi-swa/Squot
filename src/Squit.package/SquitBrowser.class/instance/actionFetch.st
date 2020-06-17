actions
actionFetch
	| workingCopy repository gitRepository remoteNames |
	self withUnitOfWork:
	[workingCopy := self projectSelection.
	repository := workingCopy repository.
	gitRepository := repository fsgitRepository.
	remoteNames := self chooseRemotesFrom: gitRepository.
	remoteNames ifNil: [^ self].
	remoteNames ifEmpty: [UIManager default inform: 'Nothing selected.'. ^ self].
	self fetchFrom: repository remoteNames: remoteNames].