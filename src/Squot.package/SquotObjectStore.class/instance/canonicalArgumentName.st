*Squot-Tools
canonicalArgumentName
	^ (self class name beginsWith: 'Squot')
		ifTrue: [self class name allButFirst: 'Squot' size]
		ifFalse: [super canonicalArgumentName]