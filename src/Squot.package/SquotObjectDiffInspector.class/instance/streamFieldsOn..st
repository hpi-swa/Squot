as yet unclassified
streamFieldsOn: aStream
	super streamFieldsOn: aStream.
	self object referenceDiffsWithDefaultOwners: {nil. nil} reflectedIn: SquotSystemSingletonMirror new
		do: [:each | aStream nextPut: (self fieldForReferenceDiff: each)].