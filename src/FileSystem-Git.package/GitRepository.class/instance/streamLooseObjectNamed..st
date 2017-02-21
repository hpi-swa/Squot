accessing-objects
streamLooseObjectNamed: aHexHash
	^ self 
		streamLooseObjectNamed: aHexHash 
		ifAbsent: [ GitObjectNotFoundError
			signal: 'Could not find loose object.' 
			with: aHexHash ]