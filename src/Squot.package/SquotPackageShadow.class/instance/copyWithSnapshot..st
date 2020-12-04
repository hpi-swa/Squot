patching
copyWithSnapshot: aMCSnapshot
	^ self copy
		setPackageName: packageName
		snapshot: aMCSnapshot
		tonelProperties: tonelProperties;
		yourself