Squot-shadow-diffing
squotDiffAgainst: otherShadow with: aDiffBuilder
	"Answer an object that describes the differences between me and otherContent."
	^ (otherShadow species = self species)
		ifTrue: [otherShadow squotWith: aDiffBuilder diffFromSequence: string]
		ifFalse: [aDiffBuilder replacing: self with: otherShadow]