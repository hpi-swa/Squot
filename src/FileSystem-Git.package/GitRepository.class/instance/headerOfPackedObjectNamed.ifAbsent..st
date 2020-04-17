accessing-objects
headerOfPackedObjectNamed: aHexHash ifAbsent: aBlock
	self privateDeprecatedUseUnitOfWork.
	self packsDo: [ :pack |
		(pack headerOfObjectNamed: aHexHash) ifNotNilDo: [:header | ^ header]].
	^ aBlock value