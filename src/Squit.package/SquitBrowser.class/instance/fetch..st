actions
fetch: aWorkingCopy
	| repository gitRepository remoteNames |
	repository := aWorkingCopy repository.
	gitRepository := repository fsgitRepository.
	remoteNames := self chooseRemotesFrom: gitRepository.
	remoteNames ifNil: [^ self].
	remoteNames ifEmpty: [self inform: 'Nothing selected.'. ^ self].
	self fetchFrom: repository remoteNames: remoteNames.