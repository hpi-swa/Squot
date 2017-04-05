storing
compressedForPackOn: aStream
	| zip |
	zip := ZLibWriteStream on: aStream.
	[ self byteDataOn: zip ]
		ensure: [ zip finish ]