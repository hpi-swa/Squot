running
registerWorkingCopy
	| name |
	workingCopy := SquotWorkingCopy newOnObjectMemory.
	workingCopy repository: repository.
	self setLoadedHistorianFromHead.
	name := SquotGUI request: 'Project name:'.
	name ifEmpty: [^ nil].
	workingCopy name: name.
	workingCopy register.
	^ workingCopy