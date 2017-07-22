initialize-release
packageName: aString leftSnapshot: leftMCSnapshot rightSnapshot: rightMCSnapshot
	packageName := aString.
	patch := rightMCSnapshot patchRelativeToBase: leftMCSnapshot.