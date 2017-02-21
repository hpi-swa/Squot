accessing-objects
streamPackedObjectNamed: aHexHash
	^ self 
		streamPackedObjectNamed: aHexHash
		ifAbsent: [ 
			GitObjectNotFoundError 
				signal: 'No pack contained the requested object.'
				with: aHexHash ]