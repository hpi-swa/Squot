helpers-verifying
verifyDeltificationWithBaseAt: baseOffset
	| interpreter baseSize finalSize finalObjectBytes baseObjectBytes result pack position unpackedDelta |
	"GitDeltaInterpreter GitPack and GitPackedObject already contain the necessary code."
	interpreter := GitDeltaInterpreter new.
	position := packReader position.
	unpackedDelta := (GitZLibReadStream on: packReader upToEnd) contents.
	packReader position: position.
	interpreter 
		instVarNamed: 'commands' put: unpackedDelta readStream;
		instVarNamed: 'instructions' put: unpackedDelta. 

	pack := self packFileForDeltificationBase.

	baseSize := interpreter readBaseObjectSize.
	finalSize := interpreter readFinalObjectSize.
	baseObjectBytes := (pack objectAtOffset: baseOffset) unpackedBytes.
	finalObjectBytes := interpreter runAgainst: baseObjectBytes.
	
	result := baseObjectBytes size = baseSize.
	^ result and: [ (finalObjectBytes size = finalSize) ]