instance creation
forPackageNamed: aString
leftSnapshot: leftMCSnapshot rightSnapshot: rightMCSnapshot baseSnapshot: baseMCSnapshot
	^ self new
		packageName: aString
		leftSnapshot: leftMCSnapshot
		rightSnapshot: rightMCSnapshot
		baseSnapshot: baseMCSnapshot;
		yourself