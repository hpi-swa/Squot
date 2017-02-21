operations-writing-index
writeIndexFileTrailerOn: aStream
	aStream 
		nextPutAll: self packFileChecksum;
		nextPutAll: (GitHash from: aStream contents) byteHash