public-accessing-objects
objectNamed: aHash
	^ self 
		objectNamed: aHash asHexHash 
		ifAbsent: [ 
			GitObjectNotFoundError 
				signal: aHash printString, ' not found'
				with: aHash]