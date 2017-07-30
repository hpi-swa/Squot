patching
squotApplyTo: aShadow with: aPatcher
	"Apply my changes to aContentObject (the representation of an object in a snapshot)
	and answer the result."
	^ aShadow applyDiff: self with: aPatcher