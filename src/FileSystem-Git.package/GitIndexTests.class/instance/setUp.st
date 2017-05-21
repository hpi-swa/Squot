running
setUp
	| memoryFile |
	super setUp.
	memoryFile := FileSystem memory / 'index'.
	memoryFile writeStreamDo: [:stream | stream binary; nextPutAll: self indexBytes].
	index := GitIndex on: memoryFile in: nil.