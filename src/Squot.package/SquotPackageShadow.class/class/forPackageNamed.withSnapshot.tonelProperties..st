instance creation
forPackageNamed: aString withSnapshot: aMCSnapshot tonelProperties: aDictionary
	^ self new
		setPackageName: aString snapshot: aMCSnapshot tonelProperties: aDictionary;
		yourself