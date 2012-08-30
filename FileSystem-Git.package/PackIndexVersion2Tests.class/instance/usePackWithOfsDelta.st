running
usePackWithOfsDelta
	packFile writeStreamDo: [ :stream |
		stream nextPutAll: self packBytesWithOfsDelta ].
	indexFile writeStreamDo: [ :stream |
		stream nextPutAll: self indexBytesWithOfsDelta ] 