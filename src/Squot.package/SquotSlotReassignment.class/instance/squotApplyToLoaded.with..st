Squot-diff-patching
squotApplyToLoaded: anObject with: aPatcher
	| patchedShadow |
	self flag: 'might be better to apply all slotChanges of a SquotObjectDiff on the shadow first, then materialize it only once'.
	patchedShadow := (aPatcher shadowOf: anObject) applyDiff: self with: aPatcher.
	aPatcher materialize: patchedShadow in: anObject.
	^ anObject