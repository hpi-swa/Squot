public-accessing-objects
objectNamed: aHash
	aHash ifNil: [^ nil].
	^ self 
		objectNamed: aHash asHexHash 
		ifAbsent: [ 
			GitObjectNotFoundError 
				signal: aHash printString, ' not found'
				with: aHash]