tests
testFindsPackageInSubdirectory
	| packageDirectories |
	(rootDirectory / 'src' / 'Xyz.package') ensureDirectory.
	(rootDirectory / 'src' / 'Xyz.package' / '.filetree') ensureFile.
	packageDirectories := locator locateArtifactsForClass: PackageInfo in: rootDirectory.
	self assert: (packageDirectories includes: rootDirectory / 'src' / 'Xyz.package').