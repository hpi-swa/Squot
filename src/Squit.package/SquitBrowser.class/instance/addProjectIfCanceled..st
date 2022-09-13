actions
addProjectIfCanceled: cancelBlock
	| workingCopy name directory repositoryPath |
	directory := (SquotGUI chooseDirectory: 'Repository directory').
	directory ifNil: [^ cancelBlock value].
	name := SquotGUI request: 'Project name:' initialAnswer: directory directoryEntry name.
	name ifEmpty: [^ cancelBlock value].
	workingCopy := SquotWorkingCopy newOnObjectMemory.
	workingCopy name: name.
	repositoryPath := directory pathName.
	workingCopy repository: (SquitRepository new initializeInDirectory: (FileSystem disk root resolve: repositoryPath)).
	workingCopy repository unitOfWork activateDuring:
	[workingCopy loadedHistorian: workingCopy repository headHistorian].
	workingCopy register.
	^ workingCopy