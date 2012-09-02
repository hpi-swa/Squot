helpers-verifying
verifyDeltificationWithBaseAt: baseOffset
	| interpreter baseSize finalSize finalObjectBytes baseObjectBytes result dummyFS pack position unpackedDelta |
	"GitDeltaInterpreter GitPack and GitPackedObject already contain the necessary code."
	interpreter := GitDeltaInterpreter new.
	position := packReader position.
	unpackedDelta := (ZLibReadStream on: packReader upToEnd) contents.
	packReader position: position.
	interpreter 
		instVarNamed: 'commands' put: unpackedDelta readStream;
		instVarNamed: 'instructions' put: unpackedDelta. 

	dummyFS := FileSystem memory.
	(dummyFS root / 'pack.idx') writeStreamDo: [ :stream | 
		stream nextPutAll: self indexBytesWithRefDelta ].
	(dummyFS root / 'pack.pack') writeStreamDo: [ :stream |
		stream nextPutAll: self packBytesWithRefDelta ].
	 
	pack := GitPackFile on: dummyFS root / 'pack.pack' in: nil.

	baseSize := interpreter readBaseObjectSize.
	finalSize := interpreter readFinalObjectSize.
	baseObjectBytes := (pack objectAtOffset: baseOffset) unpackedBytes.
	finalObjectBytes := interpreter runAgainst: baseObjectBytes.
	
	result := baseObjectBytes size = baseSize.
	^ result and: [ (finalObjectBytes size = finalSize) ]