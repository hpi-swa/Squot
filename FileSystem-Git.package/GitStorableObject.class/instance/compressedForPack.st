storing
compressedForPack
	| zip |
	zip := (ZLibWriteStream on: ByteArray new)
		nextPutAll: self byteData; 
		close;
		yourself.
	^ zip encodedStream contents