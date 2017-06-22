testing
patch: original to: target
	"Modify original to be like target"
	| diff shadowOfOriginal |
	shadowOfOriginal := capturer capture: original.
	diff := shadowOfOriginal squotDiffAgainst: (capturer capture: target).
	^ diff squotApplyToLoaded: original