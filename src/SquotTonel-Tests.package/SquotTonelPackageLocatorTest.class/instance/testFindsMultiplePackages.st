tests
testFindsMultiplePackages
	| packageDirectories |
	"given"
	#('X' 'Y')
		do: [:each | (rootDirectory / each) ensureDirectory.
					(rootDirectory / each / 'package.st') ensureFile ].
	"decoys"
	(rootDirectory / 'WithoutPackageSt') ensureDirectory.
	"when"
	packageDirectories := locator locateArtifactsForClass: PackageInfo in: rootDirectory.
	"then"
	self assert: (packageDirectories includes: rootDirectory / 'X');
		assert: (packageDirectories includes: rootDirectory / 'Y');
		assert: packageDirectories size = 2.