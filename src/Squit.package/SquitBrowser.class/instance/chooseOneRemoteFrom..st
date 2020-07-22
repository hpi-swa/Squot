user requests
chooseOneRemoteFrom: gitRepository
	| remoteNames selection |
	remoteNames := self chooseableRemoteNamesFrom: gitRepository.
	remoteNames ifEmpty: [^ self offerToAddRemoteTo: gitRepository].
	selection := remoteNames size = 1
		ifTrue: [remoteNames anyOne]
		ifFalse: [UIManager default
			chooseFrom: remoteNames
			values: remoteNames
			title: 'Choose a remote (http only):'].
	^ selection