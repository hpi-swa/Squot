running
registerWorkingCopy

	workingCopy := SquotWorkingCopy newOnObjectMemory.
	workingCopy repository: repository.
	self setLoadedHistorianFromHead.
	workingCopy name: name.
	workingCopy register.
	^ workingCopy