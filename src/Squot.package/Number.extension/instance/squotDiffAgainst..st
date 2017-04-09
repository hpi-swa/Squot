*Squot
squotDiffAgainst: anInteger
	anInteger = self ifTrue: [^ SquotDiffOfEqualObjects instance].
	^ SquotArtifactDiff left: self right: anInteger