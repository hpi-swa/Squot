testing
packedRefsTestFile
	^ FileSystem memory / 'packed-refs'
		writeStreamDo: [:stream | stream text; nextPutAll: self packedRefsTestContents];
		yourself