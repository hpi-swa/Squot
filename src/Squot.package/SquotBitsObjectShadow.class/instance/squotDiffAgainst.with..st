Squot-shadow-diffing
squotDiffAgainst: otherShadow with: aDiffBuilder
	"Answer an object that describes the differences between me and otherContent."
	^ (value species = otherShadow value species)
		ifTrue: [otherShadow squotWith: aDiffBuilder diffFromSequence: value]
		ifFalse: [aDiffBuilder replacing: self with: otherShadow]