adding and removing
initializeStoreInfo: aTrackedObjectMetadata forObject: anObject
	aTrackedObjectMetadata at: #path put:
		((pathTransformationRules
			at: anObject
			ifAbsent: [self error: 'Mock not prepared for object: ', anObject printString])
			value: (aTrackedObjectMetadata at: #path)).