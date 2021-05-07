utilities
newToolOn: aMerge
	^ (SquotMergeTool on: aMerge)
		workingCopy: workingCopy;
		yourself