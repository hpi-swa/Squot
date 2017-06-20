Squot-shadow-diffing
squotDiffAgainst: otherContent with: aDiffBuilder
	"Answer an object that describes the differences between me and otherContent."
	^ aDiffBuilder replacing: self with: otherContent