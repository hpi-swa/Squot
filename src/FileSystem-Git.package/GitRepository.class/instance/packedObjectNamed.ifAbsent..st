accessing-objects
packedObjectNamed: aHexHash ifAbsent: aBlock
	self packsDo: [ :pack |
		(pack objectNamed: aHexHash) ifNotNilDo: [ :object | ^ object object ] ].
	^ aBlock value