actions on working copies
actionObjectPackageAdd
	| selection subPath |
	selection := self choosePackagesFromCategories ifEmpty: [^ self].
	subPath := self requestPathInWorkingCopy.
	subPath ifNil: [^ self].
	selection do: [:each | self projectSelection addPackageNamed: each at: subPath]