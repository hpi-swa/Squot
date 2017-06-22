patching
squotApplyToLoaded: anObject with: aPatcher
	slotChanges associationsDo: [:each | each squotApplyToLoaded: anObject with: aPatcher].
	^ anObject