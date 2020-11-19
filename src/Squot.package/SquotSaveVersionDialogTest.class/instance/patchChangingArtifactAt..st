test objects
patchChangingArtifactAt: path
	| object save |
	workingCopy := SquotWorkingCopy forTestInMemory.
	object := ValueHolder new contents: 1; yourself.
	workingCopy add: object at: path;
		saveVersionWithMessage: 'add object'.
	object contents: 2.
	save := workingCopy newSaveOperation.
	save
		message: 'update object';
		applyToWorkingCopy.
	^ save patch