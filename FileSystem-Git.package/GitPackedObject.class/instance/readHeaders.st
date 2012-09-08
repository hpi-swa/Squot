processing
readHeaders
	typeByte := self sourceStream peek.
	length := self readUnpackedDataSize