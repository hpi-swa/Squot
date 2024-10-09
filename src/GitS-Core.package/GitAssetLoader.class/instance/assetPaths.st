accessing
assetPaths
	^ self assetFSPaths collect: [:each | GSPathUtilities asString: each]