tests
testFindsPackageUnderRoot
	| packageDirectories |
	(rootDirectory / 'Xyz') ensureDirectory.
	(rootDirectory / 'Xyz' / 'package.st') ensureFile.
	packageDirectories := locator locateArtifactsForClass: PackageInfo in: rootDirectory.
	self assert: (packageDirectories includes: rootDirectory / 'Xyz').