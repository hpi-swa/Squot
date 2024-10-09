*GitS-Core-Sound
fromAIFFStream: aStream
	aStream binary.
	^ AIFFFileReader new
		readFromStream: aStream
		mergeIfStereo: false
		skipDataChunk: false;
		sound