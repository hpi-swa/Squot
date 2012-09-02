operations-writing-pack
writePackFileTrailerOn: aStream
	self packFileChecksum: (GitHash from: aStream contents) byteHash.
	
	aStream nextPutAll: self packFileChecksum 