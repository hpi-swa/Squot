delegate
basenameFromEntry: entry
	entry class == GitTreeEntry ifTrue: [^ entry entryName].
	^ cacheStore basenameFromEntry: entry