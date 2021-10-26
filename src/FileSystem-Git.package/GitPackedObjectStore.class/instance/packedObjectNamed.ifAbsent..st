private
packedObjectNamed: aHexHash ifAbsent: aBlock
	self packsDo: [ :pack |
		(pack objectNamed: aHexHash) ifNotNil:
			[ :object | ^ object object ] ].
	^ aBlock value