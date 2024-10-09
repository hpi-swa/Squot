ui
assetList
	^ (self mappers collect: [:each | GSPathUtilities asString: each path]) sorted