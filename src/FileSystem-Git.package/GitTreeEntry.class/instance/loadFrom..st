initialize-release
loadFrom: aStream
	self loadModeFrom: aStream.
	entryName := (aStream upTo: 0) asString.
	entryHash := (aStream next: 20) asInteger.
	^self