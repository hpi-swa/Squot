testing
packedRefsTestFile
	^ FileSystem memory / 'packed-refs'
		writeStreamDo: [:stream | stream binary; nextPutAll: self packedRefsTestContents asByteArray];
		yourself