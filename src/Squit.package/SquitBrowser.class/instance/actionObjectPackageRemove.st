actions on working copies
actionObjectPackageRemove
	| workingCopy packageNames selection |
	workingCopy := self projectSelection.
	packageNames := workingCopy store objectPaths sorted.
	selection := UIManager default
		chooseMultipleFrom: packageNames
		values: packageNames
		title: 'Choose Packages To Remove:'.
	selection ifNil: [^ self].
	selection ifEmpty: [UIManager default inform: 'Nothing selected.'. ^ self].
	selection collect: [:each | workingCopy store objectAt: each]
		thenDo: [:each | workingCopy remove: each]