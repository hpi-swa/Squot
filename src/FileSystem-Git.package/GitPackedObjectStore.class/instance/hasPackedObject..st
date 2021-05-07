testing
hasPackedObject: aHexHash
	self headerOfPackedObjectNamed: aHexHash ifAbsent: [^ false].
	^ true