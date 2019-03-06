tests
testFindsPackageInSubdirectory
	| packageDirectories |
	(rootDirectory / 'src' / 'Xyz.package') ensureDirectory.
	(rootDirectory / 'src' / 'Xyz.package' / '.filetree') ensureFile.
	packageDirectories := fileStore findCypressPackageDirectories.
	self assert: (packageDirectories includes: rootDirectory / 'src' / 'Xyz.package').