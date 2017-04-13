actions
actionObjectPackageRemove
	| packageNames selection |
	packageNames := self projectSelection store objectPaths sorted.
	selection := UIManager default
		chooseMultipleFrom: packageNames
		values: packageNames
		title: 'Choose Packages To Remove:'.
	selection ifNil: [^ self].
	selection ifEmpty: [UIManager default inform: 'Nothing selected.'. ^ self].
	selection collect: [:each | self projectSelection store objectAt: each]
		thenDo: [:each | self projectSelection remove: each]