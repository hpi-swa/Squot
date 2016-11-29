accessing-objects
streamPackedObjectNamed: aHexHash ifAbsent: aBlock
	| packedObject |
	packedObject :=
		self 
			packedObjectNamed: aHexHash
			ifAbsent: [ nil ].
	^ packedObject
		ifNotNil: [ packedObject byteSignature readStream "this is stupid, should read from the pack directly" ]
		ifNil: aBlock