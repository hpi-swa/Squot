Squot-shadow-diffing
squotDiffAgainst: otherPackageShadow withBase: basePackageShadow with: aDiffBuilder
	^ aDiffBuilder diffFrom: self to: otherPackageShadow
		ifNew: [basePackageShadow
				asBaseDiffLeft: snapshot withRight: otherPackageShadow with: aDiffBuilder]
		andInitialize: []