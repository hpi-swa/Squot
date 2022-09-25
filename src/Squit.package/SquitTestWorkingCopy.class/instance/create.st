accessing
create
	workingCopy ifNotNil: [self tearDown].
	workingCopy := SquotToggles useNewApi ifTrue: [SquotWorkingCopy2 repository: nil] ifFalse: [SquotWorkingCopy newOnObjectMemory].
	workingCopy name: '(Working copy for unit tests)'.
	workingCopy register.