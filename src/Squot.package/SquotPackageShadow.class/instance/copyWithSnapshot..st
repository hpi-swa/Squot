patching
copyWithSnapshot: aMCSnapshot
	^ self copy
		packageName: packageName snapshot: aMCSnapshot;
		yourself