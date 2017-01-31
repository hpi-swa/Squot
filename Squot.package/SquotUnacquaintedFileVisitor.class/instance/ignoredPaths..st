initialize-release
ignoredPaths: aCollectionOfPathsOrStrings

	ignoredPaths := aCollectionOfPathsOrStrings
		collect: [:each | (fileStore directory resolve: each) path ]
		as: Set.