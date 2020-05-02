utilities
newToolOn: aPatch
	^ (SquotSaveVersionDialog on: aPatch)
		workingCopy: workingCopy;
		message: 'this is a test';
		yourself