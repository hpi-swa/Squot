actions
actionObjectPackageAdd
	| selection version workingDir path subPath |
	selection := self choosePackagesFromCategories ifEmpty: [^ self].
	version := self projectSelection loadedHistorian version.
	version
		ifNil: [subPath := UIManager default
				request: 'Enter the relative path in the working copy for the package'
				initialAnswer: 'src']
		ifNotNil: [workingDir := SquitRepositoryFilesystemExtension new
				repository: self projectSelection repository;
				forVersion: version.
			path := SquitSubFolderList modalFolderSelector: (FSFileDirectoryAdapter on: workingDir).
			path ifNil: [^ self].
			(path pathName beginsWith: workingDir pathString)
				ifFalse: [UIManager default inform: 'No subdirectory selected.'. ^ self].
			subPath := path pathName allButFirst: workingDir pathString size].
	subPath ifNotEmpty: [
		subPath first asString = FileDirectory slash
			ifTrue: [subPath := subPath allButFirst]].
	selection do: [:each | self projectSelection addPackageNamed: each at: subPath]