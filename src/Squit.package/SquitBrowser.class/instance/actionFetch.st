actions
actionFetch
	| gitRepository remoteNames selection |
	gitRepository := self projectSelection repository gitRepository.
	remoteNames := gitRepository remoteNames.
	selection := UIManager default
		chooseMultipleFrom: remoteNames
		values: remoteNames
		title: 'Choose Remotes:'.
	selection ifNil: [^ self].
	selection ifEmpty: [UIManager default inform: 'Nothing selected.'. ^ self].
	gitRepository fetchFromAll: selection