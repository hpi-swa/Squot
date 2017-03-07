private
collectionSpecies
	^ self isBinary ifTrue: [ByteArray] ifFalse: [String]