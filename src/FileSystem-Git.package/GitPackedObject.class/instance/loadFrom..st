initialize-release
loadFrom: aStream
	self
		loadHeaderFrom: aStream;
		dataStartPosition: aStream position;
		unpack;
		lengthInPack: aStream position - self startPosition;
		computeCRC