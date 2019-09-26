Squot-shadow-diffing
squotDiffAgainst: otherContent
	"Answer an object that describes the differences between me and otherContent."
	self isThisEverCalled.
	^ self squotDiffAgainst: otherContent with: SquotDiffBuilder new