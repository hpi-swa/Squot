Squot-shadow-diffing
squotDiffAgainst: otherPackageShadow with: aDiffBuilder
	^ aDiffBuilder diffFrom: self to: otherPackageShadow
		ifNew: [otherPackageShadow diffToBase: self withSnapshot: snapshot]
		andInitialize: []