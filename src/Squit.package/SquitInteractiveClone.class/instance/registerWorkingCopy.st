running
registerWorkingCopy
	| name |
	workingCopy := SquotWorkingCopy newOnObjectMemory.
	workingCopy repository: repository.
	repository unitOfWork activateDuring:
		[workingCopy loadedHistorian: (repository historianNamed: 'master')].
	name := SquotGUI request: 'Project name:'.
	name ifEmpty: [^ nil].
	workingCopy name: name.
	workingCopy register.
	^ workingCopy