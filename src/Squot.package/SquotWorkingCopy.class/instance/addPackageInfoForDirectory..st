initialize-release
addPackageInfoForDirectory: relativePath
	| packageName packageInfo |
	packageName := relativePath basename allButLast: '.package' size.
	packageInfo := PackageInfo named: packageName.
	packageInfo mcPackage hasWorkingCopy
		ifFalse: [packageInfo classes, packageInfo extensionClasses
				ifEmpty: [^ self "not loaded"]].
	store
		addLoadedPackageInfoNamed: packageName
		at: ((FSPath root resolve: relativePath) printWithDelimiter: $/)