applying
targetReferenceOn: aPath

	^ self target
		ifNil: [self left rootDirectory resolve: aPath]
		ifNotNil: [self target resolve: aPath]