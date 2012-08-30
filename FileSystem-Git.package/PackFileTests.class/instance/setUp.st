running
setUp
	| packsDir |
	filesystem := FileSystem memory.
	repository := GitRepository on: (filesystem root / 'repo').
	repository  headFile writeStreamDo: [ :stream | 
		stream nextPutAll: '21f6939ef44d5fadc3f537300b42e4b2889cc415' ] .
	
	packsDir := filesystem root resolve: 'repo/.git/objects/pack'.
	packsDir ensureDirectory.	
	packFile := packsDir / 'pack-bbb272fda736770dc087758f6fc7c4b6324ea146.pack'.
	indexFile := packsDir / 'pack-bbb272fda736770dc087758f6fc7c4b6324ea146.idx'