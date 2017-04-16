caching
objectCacheRefreshAsync
	commitForCache = self commitSelection ifTrue: [^ self].
	objectCache := #('...').
	self changed: #objectList.
	[[self objectCacheRefresh]
		on: ProgressInitiationException do: [:e |
			e sendNotificationsTo: [ :min :max :curr | "silence"]].
	self changed: #objectList] forkAt: Processor userBackgroundPriority.
	^ objectCache