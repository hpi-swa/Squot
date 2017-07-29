patching
squotApplyToLoaded: anObject with: aPatcher
	| shadow |
	shadow := (aPatcher shadowOf: anObject) copy.
	self applyTo: shadow with: aPatcher.
	aPatcher materialize: shadow in: anObject.
	^ anObject