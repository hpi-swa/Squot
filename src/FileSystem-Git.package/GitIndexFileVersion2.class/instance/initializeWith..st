initialize-release
initializeWith: aByteArray
	| objectCount |
	super initializeWith: aByteArray.
	self verifyIndexFile.
	fanoutTable := fullStream next: 1024. "256 4-byte big-endian entries."
	objectCount := self indexForFanout: 255.
	hashStream := (fullStream next: objectCount * 20) readStream.
	crcTable := fullStream next: objectCount * 4.
	fourByteOffsetStream := (fullStream next: objectCount * 4) readStream.
	eightByteOffsetStream := (fullStream next: objectCount * 8) readStream