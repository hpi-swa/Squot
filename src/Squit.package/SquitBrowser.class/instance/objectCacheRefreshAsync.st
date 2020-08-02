caching
objectCacheRefreshAsync
	commitForCache = self commitSelection ifTrue: [^ self].
	objectCache := #('...').
	self changed: #objectList.
	[[self objectCacheRefresh]
		on: ProgressInitiationException do: [:e |
			"No progress indication expected, but since this is not run in the UI process, prevent it anyway."
			e rearmHandlerDuring: 	[e sendNotificationsTo: [ :min :max :curr | "silence"]]].
	Project current addDeferredUIMessage: [self changed: #objectList]]
		forkAt: Processor userBackgroundPriority.
	^ objectCache