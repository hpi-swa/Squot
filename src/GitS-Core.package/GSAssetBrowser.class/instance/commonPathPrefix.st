paths
commonPathPrefix
	^ GSPathUtilities
		commonPrefixOf: (self paths collect: #parent)
		ifNone: [self defaultPath]