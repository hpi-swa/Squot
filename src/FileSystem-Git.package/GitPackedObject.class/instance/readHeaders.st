processing
readHeaders
	typeByte := self sourceStream peek.
	self unpackedLength:  self readUnpackedDataSize