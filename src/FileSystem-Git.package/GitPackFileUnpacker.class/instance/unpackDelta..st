operations
unpackDelta: aPackedDelta
	(self packFile repository hasLooseObject: aPackedDelta deltaBaseName)
		ifTrue: [ aPackedDelta unpack; store ]
		ifFalse: [ self queueDelta: aPackedDelta ]