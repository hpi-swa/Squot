tests
setUp
	super setUp.
	workingCopy := (SquotToggles useNewApi ifTrue: [SquotWorkingCopy2] ifFalse: [SquotWorkingCopy]) forTestInMemory.