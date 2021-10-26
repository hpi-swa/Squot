Squot-shadow-diffing
squotDiffAgainst: otherPackageShadow with: aDiffBuilder
	self deprecated: 'See SquotPackageShadowMirror newDiffFrom:to:'.
	^ aDiffBuilder diffFrom: self to: otherPackageShadow
		ifNew: [otherPackageShadow diffToBase: self withSnapshot: snapshot]
		andInitialize: []