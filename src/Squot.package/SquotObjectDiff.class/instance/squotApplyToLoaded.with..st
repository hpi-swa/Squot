patching
squotApplyToLoaded: anObject with: aPatcher
	| shadow patchedShadow patchedObject |
	shadow := aPatcher shadowOf: anObject.
	patchedShadow := shadow applyDiff: self with: aPatcher.
	patchedObject := aPatcher materialize: patchedShadow in: anObject.
	^ patchedObject