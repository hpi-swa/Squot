public testing
isFile: aPath
	^ (cacheStore isFile: aPath)
		or: [self basicIsFile: ((self loadGitTreeEntryAt: aPath) ifNil: [^ false])]