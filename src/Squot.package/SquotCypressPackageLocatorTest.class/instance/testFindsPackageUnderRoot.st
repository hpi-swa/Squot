tests
testFindsPackageUnderRoot
	| packageDirectories |
	(rootDirectory / 'Xyz.package') ensureDirectory.
	(rootDirectory / 'Xyz.package' / '.filetree') ensureFile.
	packageDirectories := fileStore findCypressPackageDirectories.
	self assert: (packageDirectories includes: rootDirectory / 'Xyz.package').