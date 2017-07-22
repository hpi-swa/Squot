Squot-shadow-diffing
squotDiffAgainst: otherPackageShadow with: aDiffBuilder
	^ aDiffBuilder diffFrom: self to: otherPackageShadow
		ifNew: [otherPackageShadow diffWithLeftSnapshot: snapshot]
		andInitialize: []