accessing
nameToPath: aStringOrPath
	^ self basePath resolve: ((GSPathUtilities toAbsolutePath: aStringOrPath) relativeTo: FSPath root)