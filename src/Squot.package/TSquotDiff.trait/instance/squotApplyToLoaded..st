Squot-diff-patching
squotApplyToLoaded: anObject
	"Modify anObject such that it matches what I model and answer the modified object, even if it was modified in-place."
	self shouldBeImplemented.
	^ anObject