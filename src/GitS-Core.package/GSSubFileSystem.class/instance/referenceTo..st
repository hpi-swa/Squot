public
referenceTo: aResolvable
	^ self fileSystem referenceTo:
		(GSPathUtilities
			resolve: (self fileSystem pathFromObject: aResolvable)
			withRootAt: self rootPath)