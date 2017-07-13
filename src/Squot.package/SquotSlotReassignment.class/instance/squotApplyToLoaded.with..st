Squot-diff-patching
squotApplyToLoaded: anObject with: aPatcher
	| patchedShadow |
	patchedShadow := self squotApplyTo: (aPatcher shadowOf: anObject) with: aPatcher.
	aPatcher materialize: patchedShadow in: anObject.
	^ anObject