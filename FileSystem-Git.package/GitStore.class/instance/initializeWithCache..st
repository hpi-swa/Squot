initialize-release
initializeWithCache: aFilessytem
	super initialize.
	cache := aFilessytem.
	cacheStore := cache store.
	modManager := GitModificationManager 
		initializeWith: repository
		with: cache
		for: revision.