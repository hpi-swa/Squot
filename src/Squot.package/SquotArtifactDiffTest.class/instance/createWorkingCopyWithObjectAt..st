tests
createWorkingCopyWithObjectAt: path
	workingCopy := (SquotToggles useNewApi ifTrue: [SquotWorkingCopy2] ifFalse: [SquotWorkingCopy]) forTestInMemory.
	workingCopy add: ValueHolder new at: path.
	^ (workingCopy artifactAt: path) capture.