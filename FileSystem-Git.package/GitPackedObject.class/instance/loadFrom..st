initialize-release
loadFrom: aStream
	file := aStream.
	headerPos := file position.
	self 
		readHeaders;
		unpack;
		computeCRC