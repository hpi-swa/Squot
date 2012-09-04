storing
compressedForPackOn: aCollectionOrStream
	| zip |
	zip := ZLibWriteStream on: aCollectionOrStream.
	self byteDataOn: zip.
	zip close;
		yourself.
	^ zip encodedStream contents