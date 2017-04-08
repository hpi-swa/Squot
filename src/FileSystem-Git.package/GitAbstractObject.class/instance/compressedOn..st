storing
compressedOn: aStream
	| zip |
	zip := ZLibWriteStream on: aStream.
	[ self byteSignatureOn: zip ]
		ensure: [ zip finish ]