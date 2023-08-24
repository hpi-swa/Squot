delegate
basenameFromEntry: entry
	(entry isKindOf: GitTreeEntry) ifTrue: [^ entry entryName].
	^ cacheStore basenameFromEntry: entry