tests
testFindsPackageInSubdirectory
	| packageDirectories |
	(rootDirectory / 'src' / 'Xyz') ensureDirectory.
	(rootDirectory / 'src' / 'Xyz' / 'package.st') ensureFile.
	packageDirectories := fileStore findTonelPackageDirectories.
	self assert: (packageDirectories includes: rootDirectory / 'src' / 'Xyz').