*Squot-Mapper-Sound
fromAIFFStream: aStream
	^ AIFFFileReader new
		readFromStream: aStream
		mergeIfStereo: false
		skipDataChunk: false;
		sound