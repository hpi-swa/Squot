actions on working copies
actionProjectChangeDirectory
	| workingCopy directory gitRepository |
	workingCopy := self projectSelection.
	gitRepository := workingCopy repository gitRepository.
	directory := SquotGUI
		chooseDirectory: 'Repository directory'
		from: (FileDirectory on: gitRepository workingDir pathName).
	directory ifNil: [^ self].
	gitRepository workingDir: (FileSystem disk root resolve: directory pathName).
	self projectSelection: self projectSelection. "updates repositoryExists, selectedHistorian, et al."