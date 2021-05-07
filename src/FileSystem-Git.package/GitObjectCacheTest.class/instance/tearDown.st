running
tearDown
	previousEvictSetting ifFalse:
		[GitFeatureFlags evictFromObjectCache: previousEvictSetting].
	cache checkSizeInvariant.