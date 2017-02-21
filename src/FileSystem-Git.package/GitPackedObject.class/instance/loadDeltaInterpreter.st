processing
loadDeltaInterpreter
	| reader unpackedDelta |
	self sourceStream position: self dataStartPosition.
	reader := GitZLibReadStream on: self sourceStream.

	^ GitDeltaInterpreter on: reader contents