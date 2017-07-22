Squot-shadow-diffing
squotDiffAgainst: otherPackageShadow withBase: basePackageShadow with: aDiffBuilder
	^ aDiffBuilder diffFrom: self to: otherPackageShadow
		ifNew: [SquotPackageDiff
				left: self
				right: otherPackageShadow
				base: basePackageShadow]
		andInitialize: []