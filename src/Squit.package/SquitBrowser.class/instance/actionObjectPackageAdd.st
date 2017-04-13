actions
actionObjectPackageAdd
	| packageNames selection workingDir path subPath |
	packageNames := (PackageOrganizer default packageNames
		copyWithoutAll: (self packagesInCurrentStore)) sorted.
	selection := UIManager default
		chooseMultipleFrom: packageNames
		values: packageNames
		title: 'Choose Packages To Track:'.
	selection ifNil: [^ self].
	selection ifEmpty: [UIManager default inform: 'Nothing selected.'. ^ self].
	workingDir := self projectSelection repository gitRepository repository workingDir pathString.
	path := SquitSubFolderList modalFolderSelector: (FileDirectory on: workingDir).
	path ifNil: [^ self].
	(path pathName beginsWith: workingDir)
		ifFalse: [UIManager default inform: 'No subdirectory selected.'. ^ self].
	subPath := path pathName allButFirst: workingDir size.
	subPath ifNotEmpty: [
		subPath first asString = FileDirectory slash
			ifTrue: [subPath := subPath allButFirst]].
	selection do: [:each | self projectSelection addPackageNamed: each at: subPath]