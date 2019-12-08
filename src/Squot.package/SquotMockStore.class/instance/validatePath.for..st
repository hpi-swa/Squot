adding and removing
validatePath: path for: anArtifact
	| object |
	object := self objectInOwnArtifact: anArtifact.
	^ (pathTransformationRules
		at: object
		ifAbsent: [self error: 'Mock not prepared for object: ', object printString])
		value: path