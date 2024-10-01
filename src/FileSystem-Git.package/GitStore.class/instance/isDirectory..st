public testing
isDirectory: aPath
	^ (cacheStore isDirectory: aPath)
		or: [self basicIsDirectory: ((self loadGitTreeEntryAt: aPath) ifNil: [^ false])]