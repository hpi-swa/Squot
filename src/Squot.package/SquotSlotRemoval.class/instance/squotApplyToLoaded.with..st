patching
squotApplyToLoaded: anObject with: aPatcher
	self slotToBeRemoved removeFromLoaded: anObject with: aPatcher.
	^ anObject