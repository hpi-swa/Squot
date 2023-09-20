ui
assetList
	^ (self mappers collect: [:each | SquotPathUtilities asString: each path]) sorted