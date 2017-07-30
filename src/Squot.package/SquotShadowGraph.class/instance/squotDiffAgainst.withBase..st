Squot-shadow-diffing
squotDiffAgainst: otherContent withBase: baseContent
	"Answer an object that describes the merge between me and otherContent based on baseContent."
	^ self squotDiffAgainst: otherContent withBase: baseContent with: SquotDiffBuilder new