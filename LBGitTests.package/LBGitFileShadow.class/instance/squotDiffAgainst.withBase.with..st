Squot-shadow-diffing
squotDiffAgainst: otherShadow withBase: baseShadow with: aDiffBuilder
	"Answer an object that describes the merge between me and otherContent based on baseContent."
	^ self squotDiffAgainst: otherShadow with: aDiffBuilder