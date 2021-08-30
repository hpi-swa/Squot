as yet unclassified
fetch: aWorkingCopy

	| repository gitRepository remoteNames |
	repository := aWorkingCopy repository.
	gitRepository := repository fsgitRepository.
	remoteNames := gitRepository remoteNames.
	remoteNames ifNil: [^ self].
	remoteNames ifEmpty: [self inform: 'Nothing selected.'. ^ self].
	self fetchFrom: repository remoteNames: remoteNames.