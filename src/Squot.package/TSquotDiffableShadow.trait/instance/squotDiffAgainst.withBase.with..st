Squot-shadow-diffing
squotDiffAgainst: otherShadow withBase: baseShadow with: aDiffBuilder
	"Answer an object that describes the merge between me and otherContent based on baseContent."
	^ aDiffBuilder diffFrom: self to: otherShadow basedOn: baseShadow
		ifNew: [self shouldBeImplemented]
		andInitialize: [:diff | self shouldBeImplemented.
			"for example:"
			diff diff: self against: otherShadow withBase: baseShadow with: aDiffBuilder]