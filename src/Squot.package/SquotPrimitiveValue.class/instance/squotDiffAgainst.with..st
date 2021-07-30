Squot-shadow-diffing
squotDiffAgainst: otherContent with: aDiffBuilder
	"Answer an object that describes the differences between me and otherContent."
	self isThisEverCalled: 'Comparison of trivial objects'.
	self deprecated: 'See SquotSystemSingletonMirror or SquotOpaqueValueMirror newDiffFrom:to:'.
	"It makes no sense to compare trivial objects, since there are no differing editions of them."
	^ aDiffBuilder replacing: self with: otherContent