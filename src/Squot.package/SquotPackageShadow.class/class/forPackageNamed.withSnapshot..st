instance creation
forPackageNamed: aString withSnapshot: aMCSnapshot
	^ self new
		setPackageName: aString snapshot: aMCSnapshot tonelProperties: Dictionary new;
		yourself