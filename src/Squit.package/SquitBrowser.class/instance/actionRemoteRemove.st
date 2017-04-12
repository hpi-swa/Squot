actions
actionRemoteRemove
	| selection gitRepository |
	gitRepository := self projectSelection repository gitRepository.
	selection := UIManager default
		chooseFrom: gitRepository remoteNames
		title: 'Select remote to remove'.
	selection ifNil: [^ self].
	gitRepository removeRemoteNamed: selection