operations
unpackDelta: aPackedDelta
	(self packFile repository hasLooseObject: aPackedDelta deltaBaseName)
		ifTrue: [ aPackedDelta unpack; storeAsLoose ]
		ifFalse: [ self queueDelta: aPackedDelta ]