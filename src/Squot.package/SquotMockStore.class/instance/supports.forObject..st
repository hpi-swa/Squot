adding and removing
supports: aTrackedObjectMetadata forObject: anObject
	| path expectedPath |
	path := aTrackedObjectMetadata at: #path.
	expectedPath := (pathTransformationRules
		at: anObject
		ifAbsent: [self error: 'Mock not prepared for object: ', anObject printString])
		value: path.
	^ path = expectedPath