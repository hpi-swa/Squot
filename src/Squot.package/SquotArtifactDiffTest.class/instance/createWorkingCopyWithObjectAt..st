tests
createWorkingCopyWithObjectAt: path
	workingCopy := SquotWorkingCopy forTestInMemory.
	workingCopy add: ValueHolder new at: path.
	^ (workingCopy artifactAt: path) capture.