running
usePackWithTag
	packFile writeStreamDo: [ :stream |
		stream nextPutAll: self packBytesWithTag ].
	indexFile writeStreamDo: [ :stream |
		stream nextPutAll: self indexBytesWithTag ].
	(repository tagsDir / 'testtag') writeStreamDo: [ :stream |
		stream nextPutAll: '25f43f451071dd8a6cf39accd5070d885de4b017' ]