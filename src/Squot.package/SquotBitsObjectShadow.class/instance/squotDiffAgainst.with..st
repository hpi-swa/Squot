Squot-shadow-diffing
squotDiffAgainst: otherShadow with: aDiffBuilder
	^ (value species = otherShadow value species)
		ifTrue: [aDiffBuilder diffFrom: self to: otherShadow
				ifNew: [otherShadow squotWith: aDiffBuilder diffFromSequence: value]
				andInitialize: []]
		ifFalse: [aDiffBuilder replacing: self with: otherShadow]