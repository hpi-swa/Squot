operations
unpackWithoutIndexFile
	| reader count |
	reader := self packFile readStream.
	reader reset.
	reader skip: 12. "skip header"
	
	count := self packFile numberOfObjects.
	count timesRepeat: [ | packedObject |
		packedObject := self packFile objectAtOffset: reader position.
		packedObject class = GitPackedNonDelta 
			ifTrue: [ packedObject store ]
			ifFalse: [ self unpackDelta: packedObject ].
		reader position: reader position + packedObject lengthInPack.
		
		count := count - 1 ].
	self processDeltas