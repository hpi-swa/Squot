*Squot
squotDiffAgainst: anInteger
	anInteger = self ifTrue: [^ SquotDiffOfEqualObjects instance].
	^ SquotSimpleValueDiff left: self right: anInteger