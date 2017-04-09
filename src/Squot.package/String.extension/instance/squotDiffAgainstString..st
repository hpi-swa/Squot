*Squot
squotDiffAgainstString: leftSideString
	leftSideString = self ifTrue: [^ SquotDiffOfEqualObjects instance].
	^ TextDiffBuilder buildDisplayPatchFrom: leftSideString to: self