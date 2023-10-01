paths
commonPackagePathPrefix
	^ SquotPathUtilities
		commonPrefixOf: (self mappers collect: #path)
		ifNone: [self defaultPackagePath]