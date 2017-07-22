instance creation
forPackageNamed: aString withSnapshot: aMCSnapshot
	^ self new
		packageName: aString snapshot: aMCSnapshot;
		yourself