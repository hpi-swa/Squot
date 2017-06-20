Squot-shadow-diffing
squotDiffAgainst: otherShadow
	"Answer an object that describes the differences between me and otherContent."
	^ (otherShadow ifNil: [string class empty]) squotWith: nil diffFromSequence: string