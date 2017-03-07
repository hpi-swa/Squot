initialize-release
loadHeaderFrom: aStream
	self
		sourceStream: aStream;
		startPosition: aStream position; 
		readHeaders.