objects
objectNamed: aHash
	aHash ifNil: [self error: 'Undefined object hash'].
	^ self objectCache at: aHash asHexHash
		ifAbsentPut: [self loadObjectNamed: aHash asHexHash]