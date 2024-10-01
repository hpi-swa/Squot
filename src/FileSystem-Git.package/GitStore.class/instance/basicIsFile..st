delegate
basicIsFile: entry
	(entry isKindOf: GitTreeEntry) ifTrue: [^ entry isInFileMode].
	^ cacheStore basicIsFile: entry