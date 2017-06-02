patching
squotApplyTo: aMetaobject
	"Apply my changes to aContentObject (the representation of an object in a snapshot)
	and answer the result."
	^ aMetaobject applyDiff: self