instance creation
forPackageNamed: aString withSnapshot: aMCSnapshot tonelProperties: aDictionary
	^ self newNotEmpty
		setPackageName: aString snapshot: aMCSnapshot tonelProperties: aDictionary;
		yourself