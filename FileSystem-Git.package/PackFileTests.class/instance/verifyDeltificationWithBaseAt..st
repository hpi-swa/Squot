helpers-verifying
verifyDeltificationWithBaseAt: baseOffset
	| interpreter baseSize finalSize finalObjectBytes baseObjectBytes result dummyFS pack position unpackedDelta |
	"GitDeltaInterpreter GitPack and GitPackedObject already contain the necessary code."
	interpreter := GitDeltaInterpreter new.
	position := packReader position.
	unpackedDelta := (GitZLibReadStream on: packReader upToEnd) contents.
	packReader position: position.
	interpreter 
		instVarNamed: 'commands' put: unpackedDelta readStream;
		instVarNamed: 'instructions' put: unpackedDelta. 

	dummyFS := FileSystem memory.
	repository := GitRepository on: dummyFS root / 'repo'.
	
	(repository packsDir / 'pack.idx') writeStreamDo: [ :stream | 
		stream nextPutAll: self indexBytesWithRefDelta ].
	(repository packsDir / 'pack.pack') writeStreamDo: [ :stream |
		stream nextPutAll: self packBytesWithRefDelta ].
	 
	pack := GitPackFile on: repository packsDir / 'pack.pack' in: repository.

	baseSize := interpreter readBaseObjectSize.
	finalSize := interpreter readFinalObjectSize.
	baseObjectBytes := (pack objectAtOffset: baseOffset) unpackedBytes.
	finalObjectBytes := interpreter runAgainst: baseObjectBytes.
	
	result := baseObjectBytes size = baseSize.
	^ result and: [ (finalObjectBytes size = finalSize) ]