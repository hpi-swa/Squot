storing
compressedOn: aStream
	| zip |
	zip := ZLibWriteStream on: aStream.
	self byteSignatureOn: zip.
	zip close;
		yourself.
	^ zip encodedStream contents