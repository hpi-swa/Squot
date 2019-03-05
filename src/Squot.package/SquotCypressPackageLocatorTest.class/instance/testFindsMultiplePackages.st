tests
testFindsMultiplePackages
	| packageDirectories |
	"given"
	#('X.package' 'Y.package')
		do: [:each | (rootDirectory / each) ensureDirectory.
					(rootDirectory / each / '.filetree') ensureFile ].
	"decoys"
	(rootDirectory / 'Z.package') ensureDirectory.
	(rootDirectory / 'NoPackageExtension') ensureDirectory.
	(rootDirectory / 'NoPackageExtension' / '.filetree') ensureFile.
	"when"
	packageDirectories := locator locateArtifactsForClass: PackageInfo in: rootDirectory.
	"then"
	self assert: (packageDirectories includes: rootDirectory / 'X.package');
		assert: (packageDirectories includes: rootDirectory / 'Y.package');
		assert: packageDirectories size = 2.