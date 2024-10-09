paths
commonPackagePathPrefix
	^ GSPathUtilities
		commonPrefixOf: (self mappers collect: #path)
		ifNone: [self defaultPackagePath]