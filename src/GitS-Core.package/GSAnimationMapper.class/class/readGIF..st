reading
readGIF: aStream
	"inlined GIFReadWriter class>>formsFromStream: without closing the stream"
	^ (self readerClass on: aStream)
		readHeader;
		readBody;
		yourself