public
referenceTo: aResolvable
	^ self fileSystem referenceTo:
		(SquotPathUtilities
			resolve: (self fileSystem pathFromObject: aResolvable)
			withRootAt: self rootPath)