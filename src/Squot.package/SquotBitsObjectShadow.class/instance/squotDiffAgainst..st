Squot-shadow-diffing
squotDiffAgainst: otherShadow
	^ (otherShadow ifNil: [value class new: 0]) squotWith: nil diffFromSequence: value