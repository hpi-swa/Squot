delegate
basicIsDirectory: anEntry
	anEntry class == GitTreeEntry ifTrue: [^ anEntry isInDirectorymode].
	^ cacheStore basicIsDirectory: anEntry