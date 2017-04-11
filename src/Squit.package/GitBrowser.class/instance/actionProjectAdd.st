actions
actionProjectAdd
	| workingCopy repositoryPath |
	workingCopy := SquotWorkingCopy newOnObjectMemory.
	workingCopy name: (UIManager default request: 'Project name:').
	repositoryPath := (UIManager default chooseDirectory: 'Repository directory') pathName.
	workingCopy repository: (SquitRepository new initializeInDirectory: (FileSystem disk root resolve: repositoryPath)).
	workingCopy loadedHistorian: (workingCopy repository historianNamed: 'master').
	workingCopy register.
	self changed: #projectList