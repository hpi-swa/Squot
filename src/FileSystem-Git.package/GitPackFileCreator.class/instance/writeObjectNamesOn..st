operations-writing-index
writeObjectNamesOn: aStream
	self sortedHashes do: [ :integer |
		aStream nextPutAll: integer asByteHash ]