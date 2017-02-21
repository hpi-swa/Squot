operations-writing-index
write4ByteIndexTableOn: aStream
	| index |
	index := 0.
	self sortedHashes do: [ :integer |
		aStream nextPutAll: ((index bitOr: 16r80000000) asByteArrayOfSize: 4).
		index := index + 8 ]