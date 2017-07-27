initialize-release
packageName: aString leftSnapshot: leftMCSnapshot rightSnapshot: rightMCSnapshot baseSnapshot: baseMCSnapshot
	packageName := aString.
	patch := leftMCSnapshot squotDiffAgainst: rightMCSnapshot withBase: baseMCSnapshot.