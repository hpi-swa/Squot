processing
loadDeltaInterpreter
	| reader unpackedDelta |
	reader := ZLibReadStream on: file.
	unpackedDelta := reader contents.
	packedLength := packedLength + reader sourcePosition.
	^ GitDeltaInterpreter on: unpackedDelta