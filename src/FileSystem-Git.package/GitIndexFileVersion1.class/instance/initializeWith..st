initialize-release
initializeWith: aByteArray
	| objectCount |
	super initializeWith: aByteArray.
	fanoutTable := fullStream next: 1024. "256 4-byte big-endian entries."
	objectCount := self indexForFanout: 255.
	hashStream := (fullStream next: objectCount * 24) readStream