private
headerOfPackedObjectNamed: aHexHash ifAbsent: aBlock
	self packsDo: [ :pack |
		(pack headerOfObjectNamed: aHexHash) ifNotNil: [:header | ^ header]].
	^ aBlock value