applying
targetReferenceOn: aPath

	^ self target
		ifNil: [self isThisEverCalled: 'targetreferenc but target is nil'. self left rootDirectory resolve: aPath]
		ifNotNil: [self target resolve: aPath]