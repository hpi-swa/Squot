patching
squotApplyTo: aMetaobject with: aDiffBuilder
	"Apply my changes to aContentObject (the representation of an object in a snapshot)
	and answer the result."
	^ (aMetaobject ifNil: [originalClass absentPrototypeForSquot captureWithSquot]) applyDiff: self with: aDiffBuilder