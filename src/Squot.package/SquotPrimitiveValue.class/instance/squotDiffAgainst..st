Squot-shadow-diffing
squotDiffAgainst: otherContent
	"Answer an object that describes the differences between me and otherContent."
	self isThisEverCalled: 'Comparison of trivial objects'.
	"It makes no sense to compare trivial objects, since there are no differing editions of them."
	^ SquotDiffBuilder new left: self right: otherContent