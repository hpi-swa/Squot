testing
patch: original to: target
	"Modify original to be like target"
	| diff shadowOfOriginal |
	shadowOfOriginal := original captureWithSquot.
	diff := shadowOfOriginal squotDiffAgainst: target captureWithSquot.
	^ diff squotApplyToLoaded: original