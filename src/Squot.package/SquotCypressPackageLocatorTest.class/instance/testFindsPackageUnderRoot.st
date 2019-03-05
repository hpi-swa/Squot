tests
testFindsPackageUnderRoot
	| packageDirectories |
	(rootDirectory / 'Xyz.package') ensureDirectory.
	(rootDirectory / 'Xyz.package' / '.filetree') ensureFile.
	packageDirectories := locator locateArtifactsForClass: PackageInfo in: rootDirectory.
	self assert: (packageDirectories includes: rootDirectory / 'Xyz.package').