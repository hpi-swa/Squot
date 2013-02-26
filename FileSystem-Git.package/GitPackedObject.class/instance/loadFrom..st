initialize-release
loadFrom: aStream
	self
		sourceStream: aStream;
		startPosition: aStream position; 
		readHeaders;
		dataStartPosition: aStream position;
		unpack;
		lengthInPack: aStream position - self startPosition;
		computeCRC