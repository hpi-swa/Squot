actions
addProjectIfCanceled: cancelBlock
	| workingCopy name directory repositoryPath |
	workingCopy := SquotWorkingCopy newOnObjectMemory.
	name := SquotGUI request: 'Project name:'.
	name ifEmpty: [^ cancelBlock value].
	workingCopy name: name.
	directory := (SquotGUI chooseDirectory: 'Repository directory').
	directory ifNil: [^ cancelBlock value].
	repositoryPath := directory pathName.
	workingCopy repository: (SquitRepository new initializeInDirectory: (FileSystem disk root resolve: repositoryPath)).
	workingCopy repository unitOfWork activateDuring:
	[workingCopy loadedHistorian: (workingCopy repository historianNamed: 'master')].
	workingCopy register.
	^ workingCopy