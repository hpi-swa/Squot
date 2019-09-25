initialize-release
packageName: aString leftSnapshot: leftMCSnapshot rightSnapshot: rightMCSnapshot
	self deprecated.
	packageName := aString.
	patch := rightMCSnapshot patchRelativeToBase: leftMCSnapshot.