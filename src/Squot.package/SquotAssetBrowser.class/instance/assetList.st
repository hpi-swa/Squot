ui
assetList
	^ (self mappers collect: [:each | self pathToString: each path]) sorted