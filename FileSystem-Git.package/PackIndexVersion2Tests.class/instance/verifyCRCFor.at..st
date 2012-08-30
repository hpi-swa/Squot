verifying
verifyCRCFor: hexHash at: offset
	| pack object index offsetFound |
	pack := GitPackFile on: packFile in: repository.
	index := pack indexFile indexForObjectNamed: hexHash.
	offsetFound := pack indexFile offsetForIndex: index.
	
	self assert: offsetFound equals: offset.
	object := pack objectAtOffset: offsetFound.
	self assert: object crc equals: (pack indexFile crcAt: index)