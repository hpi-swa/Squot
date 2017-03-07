initialize-release
addPackageInfoForDirectory: relativePath
	| packageName |
	packageName := relativePath basename allButLast: '.package' size.
	store
		addLoadedPackageInfoNamed: packageName
		at: ((FSPath root resolve: relativePath) printWithDelimiter: $/)