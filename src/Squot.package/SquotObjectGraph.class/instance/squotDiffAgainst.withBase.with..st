Squot-shadow-diffing
squotDiffAgainst: otherContent withBase: baseContent with: aDiffBuilder
	"Answer an object that describes the merge between me and otherContent based on baseContent."
	^ aDiffBuilder left: self right: otherContent base: baseContent