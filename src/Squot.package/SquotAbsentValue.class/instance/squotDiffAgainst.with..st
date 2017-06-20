Squot-content-diff
squotDiffAgainst: otherContent with: aDiffBuilder
	otherContent == self ifTrue: [^ SquotDiffOfEqualObjects instance].
	^ (otherContent
		squotDiffAgainst: (otherContent squotAbsentContentWith: aDiffBuilder)
		with: aDiffBuilder) squotInverseDiff