user requests
chooseOneRemoteFrom: gitRepository
	| remoteNames selection |
	remoteNames := self chooseableRemoteNamesFrom: gitRepository.
	remoteNames ifEmpty: [^ SquitNoRemotes new repository: gitRepository; signal].
	selection := remoteNames size = 1
		ifTrue: [remoteNames anyOne]
		ifFalse: [SquotGUI
			chooseFrom: remoteNames
			values: remoteNames
			title: 'Choose a remote (http only):'].
	^ selection