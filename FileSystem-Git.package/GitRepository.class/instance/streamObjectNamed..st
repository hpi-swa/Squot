accessing-objects
streamObjectNamed: aHexHash
	^ self 
		streamLooseObjectNamed: aHexHash
		ifAbsent: [ self streamPackedObjectNamed: aHexHash ]