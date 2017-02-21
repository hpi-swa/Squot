operations-writing-index
writeOffsetTableOfSize: size on: aStream
	self sortedHashes do: [ :integer |
		aStream nextPutAll: ((self hashDict at: integer) asByteArrayOfSize: size) ]