user requests
chooseRemotesFrom: gitRepository
	| remoteNames selection |
	remoteNames := self chooseableRemoteNamesFrom: gitRepository.
	remoteNames ifEmpty:
		[self offerToAddRemoteTo: gitRepository
			ifAccepted: [:newRemotes | remoteNames := newRemotes]
			ifCanceled: [^ nil]].
	selection := remoteNames size = 1
		ifTrue: [remoteNames]
		ifFalse: [UIManager default
			chooseMultipleFrom: remoteNames
			values: remoteNames
			title: 'Choose Remotes (http only):'].
	^ selection