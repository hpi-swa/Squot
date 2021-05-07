helpers-verifying
newRepositoryForDeltificationBase
	| dummyFS newRepository |
	dummyFS := FileSystem memory.
	newRepository := GitRepository on: dummyFS root / 'repo'.
	
	(newRepository packsDir / 'pack.idx') writeStreamDo: [ :stream | 
		stream nextPutAll: self indexBytesWithRefDelta ].
	(newRepository packsDir / 'pack.pack') writeStreamDo: [ :stream |
		stream nextPutAll: self packBytesWithRefDelta ].
	 
	^ newRepository