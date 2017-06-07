*Squot-content-diff
squotDiffAgainst: other
	^ other
		ifNil: [SquotDiffOfEqualObjects instance]
		ifNotNil:
			[other squotAbsentContent
				ifNotNil: [other asSquotDiffOnlyRight]
				ifNil: [(other squotDiffAgainst: other squotAbsentContent) squotInverseDiff]]