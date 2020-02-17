private
headerOfPackedObjectNamed: aHexHash ifAbsent: aBlock
	self packsDo: [ :pack |
		(pack headerOfObjectNamed: aHexHash) ifNotNilDo: [:header | ^ header]].
	^ aBlock value