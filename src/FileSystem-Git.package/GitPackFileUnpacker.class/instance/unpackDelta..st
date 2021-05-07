operations
unpackDelta: aPackedDelta
	(self packFile repository unitOfWork hasLooseObject: aPackedDelta deltaBaseName)
		ifTrue: [ aPackedDelta unpack; storeAsLoose ]
		ifFalse: [ self queueDelta: aPackedDelta ]