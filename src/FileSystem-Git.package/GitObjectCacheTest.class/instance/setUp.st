running
setUp
	previousEvictSetting := GitFeatureFlags evictFromObjectCache.
	GitFeatureFlags evictFromObjectCache: true.