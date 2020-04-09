operations-writing-index
writeCRCTableOn: aStream
	self sortedHashes do: [ :integer || object |
		object := self currentUnitOfWork objectNamed: integer asHexHash.
		aStream nextPutAll: (object crc asByteArrayOfSize: 4) ]