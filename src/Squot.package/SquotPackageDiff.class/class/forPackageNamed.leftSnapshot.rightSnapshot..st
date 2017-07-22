instance creation
forPackageNamed: aString
leftSnapshot: leftMCSnapshot rightSnapshot: rightMCSnapshot
	^ self new
		packageName: aString leftSnapshot: leftMCSnapshot rightSnapshot: rightMCSnapshot;
		yourself