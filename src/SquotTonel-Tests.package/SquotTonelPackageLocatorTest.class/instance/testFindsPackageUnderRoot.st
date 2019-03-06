tests
testFindsPackageUnderRoot
	| packageDirectories |
	(rootDirectory / 'Xyz') ensureDirectory.
	(rootDirectory / 'Xyz' / 'package.st') ensureFile.
	packageDirectories := fileStore findTonelPackageDirectories.
	self assert: (packageDirectories includes: rootDirectory / 'Xyz').