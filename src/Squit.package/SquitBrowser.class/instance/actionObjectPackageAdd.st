actions on working copies
actionObjectPackageAdd
	| workingCopy selection subPath |
	workingCopy := self projectSelection.
	selection := (self choosePackagesFromCategoriesFor: workingCopy) ifEmpty: [^ self].
	subPath := self requestPathInWorkingCopy: workingCopy.
	subPath ifNil: [^ self].
	selection do: [:each | workingCopy addPackageNamed: each at: subPath]