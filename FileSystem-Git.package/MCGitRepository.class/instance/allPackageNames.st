packages
allPackageNames
	^ self readableFileNames
		select: [:each | each endsWith: '.git']
		thenCollect: [:each | each copyUpToLast: $-]