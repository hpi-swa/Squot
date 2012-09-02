initialize-release
initializeWithCache: aFilessytem
	super initialize.
	cache := aFilessytem.
	cacheStore := cache store.
	modManager := FileSystemGitModificationManager 
		initializeWith: repository
		with: cache
		for: revision.