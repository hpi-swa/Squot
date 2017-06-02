*Squot-content-diff
squotDiffAgainst: other
	^ other
		ifNil: [SquotDiffOfEqualObjects instance]
		ifNotNil: [(other squotDiffAgainst: other squotAbsentContent) squotInverseDiff]