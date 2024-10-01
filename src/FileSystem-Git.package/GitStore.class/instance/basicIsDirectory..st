delegate
basicIsDirectory: anEntry
	(anEntry isKindOf: GitTreeEntry) ifTrue: [^ anEntry isInDirectoryMode].
	^ cacheStore basicIsDirectory: anEntry