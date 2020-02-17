accessing
objectNamed: aHash
	aHash ifNil: [self error: 'Undefined object hash'].
	^ objectCache at: aHash asHexHash
		ifAbsentPut: [self loadObjectNamed: aHash]