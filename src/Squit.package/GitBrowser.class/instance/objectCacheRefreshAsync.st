accessing
objectCacheRefreshAsync
	objectCache := #('...').
	self changed: #objectList.
	[[ self objectCacheRefresh ] on: ProgressInitiationException do: [:e | e resume: nil].
	self changed: #objectList] fork.
	^ objectCache