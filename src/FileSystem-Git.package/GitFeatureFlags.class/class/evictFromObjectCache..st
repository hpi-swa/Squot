accessing
evictFromObjectCache: aBoolean
	EvictFromObjectCache := aBoolean.
	EvictFromObjectCache ifTrue:
		[GitRepository allInstancesDo: [:each | each flushCaches]].