instance creation
forPackageNamed: aString withSnapshot: aMCSnapshot
	^ self newNotEmpty
		setPackageName: aString snapshot: aMCSnapshot tonelProperties: Dictionary new;
		yourself