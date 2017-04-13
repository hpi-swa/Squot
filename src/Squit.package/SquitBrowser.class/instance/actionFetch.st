actions
actionFetch
	| gitRepository remoteNames selection |
	gitRepository := self projectSelection repository gitRepository.
	remoteNames := gitRepository remoteNames select:
		[:each | (gitRepository remoteUrl: each) beginsWith: 'http'].
	selection := UIManager default
		chooseMultipleFrom: remoteNames
		values: remoteNames
		title: 'Choose Remotes (http only):'.
	selection ifNil: [^ self].
	selection ifEmpty: [UIManager default inform: 'Nothing selected.'. ^ self].
	gitRepository fetchFromAll: selection.
	self refresh.