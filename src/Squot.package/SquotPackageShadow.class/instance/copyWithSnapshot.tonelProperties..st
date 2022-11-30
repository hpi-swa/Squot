patching
copyWithSnapshot: aMCSnapshot tonelProperties: aDictionary
	^ self copy
		setPackageName: packageName
		snapshot: aMCSnapshot
		tonelProperties: aDictionary;
		yourself