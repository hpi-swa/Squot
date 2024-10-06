accessing
nameToPath: aStringOrPath
	^ self basePath resolve: ((SquotPathUtilities toAbsolutePath: aStringOrPath) relativeTo: FSPath root)