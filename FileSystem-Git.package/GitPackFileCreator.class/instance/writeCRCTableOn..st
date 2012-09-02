operations-writing-index
writeCRCTableOn: aStream
	self sortedHashes do: [ :integer || object |
		object := self repository objectNamed: integer asHexHash.
		aStream nextPutAll: (object crc asByteArrayOfSize: 4) ]