reflection
addTo: aDictionary withValue: anObject
	^ aDictionary at: key ifPresent: [self error: 'Already exists'] ifAbsentPut: anObject