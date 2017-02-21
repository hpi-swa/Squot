accessing-objects
streamObjectNamed: aHexHash
	self flag: #refactor. "methods should not return streams that keep files open"
	^ self 
		streamLooseObjectNamed: aHexHash
		ifAbsent: [ self streamPackedObjectNamed: aHexHash ]