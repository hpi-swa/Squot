operations-writing
writeObjectsOn: aStream
	self hashes do: [ :hash || object |
		object := self repository objectNamed: hash asHexHash.
		self writeObjectHeader: object on: aStream.
		self recordOffset: aStream position for: object.
		aStream nextPutAll: object compressedForPack ]