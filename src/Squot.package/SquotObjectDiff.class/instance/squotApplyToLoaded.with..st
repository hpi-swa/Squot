patching
squotApplyToLoaded: anObject with: aPatcher
	| shadow |
	shadow := (aPatcher shadowOf: anObject) copy.
	slotChanges associationsDo: [:each | each applyTo: shadow with: aPatcher].
	aPatcher materialize: shadow in: anObject.
	^ anObject