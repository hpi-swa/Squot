Squot-diff-patching
squotApplyToLoaded: anObject with: aPatcher
	self slotToBeAdded addToLoaded: anObject with: aPatcher.
	^ anObject