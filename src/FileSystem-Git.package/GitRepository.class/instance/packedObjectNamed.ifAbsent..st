accessing-objects
packedObjectNamed: aHexHash ifAbsent: aBlock
	self packsDo: [ :pack |
		(pack objectNamed: aHexHash) ifNotNilDo:
			[ :object | ^ objectCache at: object hexHash put: object object ] ].
	^ aBlock value