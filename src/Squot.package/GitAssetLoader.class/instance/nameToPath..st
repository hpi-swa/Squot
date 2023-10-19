accessing
nameToPath: aStringOrPath
	^ self basePath resolve: ((SquotPathUtilities toPath: aStringOrPath) relativeTo: FSPath root)