running
usePackWithRefDelta
	packFile writeStreamDo: [ :stream |
		stream nextPutAll: self packBytesWithRefDelta ].
	indexFile writeStreamDo: [ :stream |
		stream nextPutAll: self indexBytesWithRefDelta ] 