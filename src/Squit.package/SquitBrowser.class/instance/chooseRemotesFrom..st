user requests
chooseRemotesFrom: gitRepository
	| remoteNames selection |
	remoteNames := self chooseableRemoteNamesFrom: gitRepository.
	remoteNames ifEmpty:
		[self inform: 'No remotes configured yet. Please add one, then fetch again.'.
		Project current addDeferredUIMessage: [self actionRemoteAdd].
		^ nil].
	selection := remoteNames size = 1
		ifTrue: [remoteNames]
		ifFalse: [SquotGUI
			chooseMultipleFrom: remoteNames
			values: remoteNames
			title: 'Choose Remotes (http only):'].
	^ selection