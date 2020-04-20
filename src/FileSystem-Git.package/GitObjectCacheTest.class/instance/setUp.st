running
setUp
	previousEvictSetting := GitFeatureFlags evictFromObjectCache.
	GitFeatureFlags evictFromObjectCacheForTests: true.
	cache := GitObjectCache new.
	repo := GitRepository memory.