utilities
newToolOn: patch
	^ (SquotChangesChooser on: patch)
		workingCopy: workingCopy;
		yourself