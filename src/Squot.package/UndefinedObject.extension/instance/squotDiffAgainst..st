*Squot
squotDiffAgainst: other
	^ other
		ifNil: [SquotDiffOfEqualObjects instance]
		ifNotNil: [other squotAbsentContent squotDiffAgainst: other]