delegate
basicIsDirectory: anEntry
	anEntry class == GitTreeEntry ifTrue: [^ anEntry isInDirectoryMode].
	^ cacheStore basicIsDirectory: anEntry