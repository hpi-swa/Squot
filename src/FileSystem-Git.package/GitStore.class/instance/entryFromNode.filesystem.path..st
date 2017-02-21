delegate
entryFromNode: anObject filesystem: aFilesystem path: aPath	
	self flag: 'TODO: check if we need to intercept here and update the modification manager and the cache'.
	^ cacheStore entryFromNode: anObject filesystem: aFilesystem path: aPath