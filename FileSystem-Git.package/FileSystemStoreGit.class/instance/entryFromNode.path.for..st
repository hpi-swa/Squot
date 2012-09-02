delegate
entryFromNode: node path: path for: aFileystem	
	self flag: 'TODO: check if we need to intercept here and update the modification manager and the cache'.
	^ cacheStore entryFromNode: node path: path for: aFileystem