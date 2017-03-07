public-accessing-objects
sizeOfObjectNamed: aHash
	^ self 
		sizeOfObjectNamed: aHash asHexHash 
		ifAbsent: [ 
			GitObjectNotFoundError 
				signal: aHash printString, ' not found'
				with: aHash]