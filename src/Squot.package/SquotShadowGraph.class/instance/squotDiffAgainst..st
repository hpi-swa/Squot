Squot-shadow-diffing
squotDiffAgainst: aGraph
	"Answer an object that describes the differences between me and otherContent."
	^ self squotDiffAgainst: aGraph with: SquotDiffBuilder new