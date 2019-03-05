tests
testFindsPackageInSubdirectory
	| packageDirectories |
	(rootDirectory / 'src' / 'Xyz') ensureDirectory.
	(rootDirectory / 'src' / 'Xyz' / 'package.st') ensureFile.
	packageDirectories := locator locateArtifactsForClass: PackageInfo in: rootDirectory.
	self assert: (packageDirectories includes: rootDirectory / 'src' / 'Xyz').