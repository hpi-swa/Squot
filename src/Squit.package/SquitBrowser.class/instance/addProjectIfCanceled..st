actions
addProjectIfCanceled: cancelBlock
	| workingCopy name directory repositoryPath |
	directory := (SquotGUI chooseDirectory: 'Repository directory').
	directory ifNil: [^ cancelBlock value].
	name := SquotGUI request: 'Project name:' initialAnswer: directory directoryEntry name.
	name ifEmpty: [^ cancelBlock value].
	repositoryPath := directory pathName.
	SquitSettings useNewApi
		ifTrue:
			[workingCopy := SquotWorkingCopy2 repository: (SquitRepository new initializeInDirectory: repositoryPath asFileReference)]
		ifFalse:
			[workingCopy := SquotWorkingCopy newOnObjectMemory.
			workingCopy repository: (SquitRepository new initializeInDirectory: (FileSystem disk root resolve: repositoryPath))].
	workingCopy name: name.
	workingCopy repository unitOfWork activateDuring:
		[SquitSettings useNewApi
			ifTrue: [workingCopy activeHistorian: workingCopy repository headHistorian]
			ifFalse: [workingCopy loadedHistorian: workingCopy repository headHistorian]].
	workingCopy register.
	^ workingCopy