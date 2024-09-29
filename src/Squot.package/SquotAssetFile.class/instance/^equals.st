comparing
= anObject
	^ self class == anObject class
		and: [self mapper = anObject mapper]
		and: [self mapper assetFile: self equals: anObject]