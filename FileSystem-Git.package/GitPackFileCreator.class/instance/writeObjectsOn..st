operations-writing-pack
writeObjectsOn: aStream
	self sortedHashes do: [ :hash || object |
		object := self repository objectNamed: hash asHexHash.
		self recordOffset: aStream position for: hash.
		self writeObjectHeader: object on: aStream.
		aStream nextPutAll: object compressedForPack ]