Squot-shadow-diffing
squotDiffAgainst: otherShadow with: aDiffBuilder
	self deprecated: 'See SquotBitsShadowMirror newDiffFrom:to:'.
	^ aDiffBuilder
		diffFrom: self to: otherShadow
		ifNew: [otherShadow squotWith: aDiffBuilder diffFromSequence: value]
		andInitialize: []