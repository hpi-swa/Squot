patching
squotApplyToLoaded: anObject with: aPatcher
	| shadow patchedShadow patchedObject |
	SquotToggles useNewObjectPatching ifTrue: [self deprecated].
	shadow := aPatcher shadowOf: anObject.
	patchedShadow := aPatcher apply: self to: shadow.
	patchedObject := aPatcher materialize: patchedShadow in: anObject.
	^ patchedObject