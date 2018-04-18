Squot-shadow-diffing
squotDiffAgainst: otherShadow with: aDiffBuilder
	"Answer an object that describes the differences between me and otherContent."
	^ aDiffBuilder diffFrom: self to: otherShadow
		ifNew: [self shouldBeImplemented]
		andInitialize: [:diff | self shouldBeImplemented.
			"for example:"
			diff diff: self against: otherShadow with: aDiffBuilder]