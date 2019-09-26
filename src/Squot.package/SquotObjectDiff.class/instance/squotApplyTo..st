patching
squotApplyTo: anObjectShadow
	"Apply my changes to aContentObject (the representation of an object in a snapshot)
	and answer the result."
	^ anObjectShadow applyDiff: self