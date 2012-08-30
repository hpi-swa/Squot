helpers
packOffsetOf: sha1
	| dummyFS pack |
	"GitPackFile / GitIndexFile already contain the necessary code."
	dummyFS := FileSystem memory.
	(dummyFS root / 'pack.idx') writeStreamDo: [ :stream | 
		stream nextPutAll: self indexBytesWithRefDelta ].
	(dummyFS root / 'pack.pack') writeStreamDo: [ :stream |
		stream nextPutAll: self packBytesWithRefDelta ].
	
	pack := GitPackFile on: dummyFS root / 'pack.pack' in: nil.
	^ pack indexFile offsetForIndex: (pack indexFile indexForObjectNamed: sha1)