patching
squotApplyTo: aShadow with: aPatcher
	"Apply my changes to aContentObject (the representation of an object in a snapshot)
	and answer the result."
	^ (aShadow ifNil: [self isThisEverCalled. self squotAbsentPrototypeOfRight captureWithSquot])
		applyDiff: self with: aPatcher