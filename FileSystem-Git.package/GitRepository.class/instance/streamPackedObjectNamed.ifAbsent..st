accessing-objects
streamPackedObjectNamed: aHexHash ifAbsent: aBlock
	| packedObject |
	packedObject :=
		self 
			packedObjectNamed: aHexHash
			ifAbsent: [ nil ].
	^ packedObject
		ifNotNil: [ packedObject byteStream ]
		ifNil: aBlock