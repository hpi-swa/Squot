running
registerWorkingCopy
	| name |
	SquitSettings useNewApi
		ifTrue: [workingCopy := SquotWorkingCopy2 repository: repository. self flag: #todo. "Test"]
		ifFalse:
			[workingCopy := SquotWorkingCopy newOnObjectMemory.
			workingCopy repository: repository].
	self setLoadedHistorianFromHead.
	name := SquotGUI request: 'Project name:'.
	name ifEmpty: [^ nil].
	workingCopy name: name.
	workingCopy register.
	^ workingCopy