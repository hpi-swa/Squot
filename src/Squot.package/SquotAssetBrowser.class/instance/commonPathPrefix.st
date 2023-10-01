paths
commonPathPrefix
	^ SquotPathUtilities
		commonPrefixOf: (self paths collect: #parent)
		ifNone: [self defaultPath]