utilities
newToolOn: patch
	^ (SquotDiffExplorer forPatch: patch)
		workingCopy: workingCopy;
		yourself