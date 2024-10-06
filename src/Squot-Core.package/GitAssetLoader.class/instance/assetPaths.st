accessing
assetPaths
	^ self assetFSPaths collect: [:each | SquotPathUtilities asString: each]