caching
objectCacheRefreshAsync
	commitForCache = self commitSelection ifTrue: [^ self].
	objectCache := #('...').
	self changed: #objectList.
	[[ self objectCacheRefresh ] on: ProgressInitiationException do: [:e | e resume: nil].
	self changed: #objectList] forkAt: Processor userBackgroundPriority.
	^ objectCache