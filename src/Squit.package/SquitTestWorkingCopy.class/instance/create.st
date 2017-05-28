accessing
create
	workingCopy ifNotNil: [self tearDown].
	workingCopy := SquotWorkingCopy newOnObjectMemory.
	workingCopy name: '(Working copy for unit tests)'.
	workingCopy register.