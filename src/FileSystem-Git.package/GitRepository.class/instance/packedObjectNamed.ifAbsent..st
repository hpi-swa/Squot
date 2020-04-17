accessing-objects
packedObjectNamed: aHexHash ifAbsent: aBlock
	self privateDeprecatedUseUnitOfWork.
	self packsDo: [ :pack |
		(pack objectNamed: aHexHash) ifNotNilDo:
			[ :object | | unpacked |
			unpacked := object object.
			self assert: (objectCache at: object hexHash ifAbsentPut: [unpacked]) = unpacked.
			^ unpacked ] ].
	^ aBlock value