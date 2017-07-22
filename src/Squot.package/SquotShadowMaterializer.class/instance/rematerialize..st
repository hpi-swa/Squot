converting
rematerialize: aShadow
	^ convertedObjects at: aShadow undecorated
		ifAbsentPut: [self findOrCreateAndRematerialize: aShadow]