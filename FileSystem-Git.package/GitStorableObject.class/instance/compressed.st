storing
compressed
	| zip |
	zip := (ZLibWriteStream on: ByteArray new)
		nextPutAll: self byteSignature; 
		close;
		yourself.
	^ zip encodedStream contents