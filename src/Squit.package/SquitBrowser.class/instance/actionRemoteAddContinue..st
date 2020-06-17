actions on working copies
actionRemoteAddContinue: aSquitAddRemote
	| gitRepository |
	aSquitAddRemote hasBeenAccepted ifFalse: [^ self].
	self withUnitOfWork:
	[gitRepository := aSquitAddRemote workingCopy repository fsgitRepository.
	gitRepository addRemote: aSquitAddRemote remoteName url: aSquitAddRemote remoteUrl.
	(UIManager default confirm: 'Do you want to fetch from remote ', aSquitAddRemote remoteName, ' now?')
		ifTrue: [self fetchFrom: aSquitAddRemote workingCopy repository remoteNames: {aSquitAddRemote remoteName} ifCancelled: [^ self]]].