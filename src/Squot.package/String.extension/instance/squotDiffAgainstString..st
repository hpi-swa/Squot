*Squot
squotDiffAgainstString: leftSideString
	leftSideString = self ifTrue: [^ SquotDiffOfEqualObjects instance].
	^ HuntMcilroyDiff new file1: leftSideString; file2: self