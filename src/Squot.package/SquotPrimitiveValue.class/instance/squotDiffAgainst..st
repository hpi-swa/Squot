Squot-shadow-diffing
squotDiffAgainst: otherContent
	"Answer an object that describes the differences between me and otherContent."
	^ SquotDiffBuilder new left: self right: otherContent