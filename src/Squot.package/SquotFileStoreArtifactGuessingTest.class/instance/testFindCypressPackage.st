tests
testFindCypressPackage
	| packageDir snapshot |
	packageDir := fileStore directory / 'src' / 'Test.package'.
	packageDir ensureDirectory.
	(packageDir / '.filetree') ensureFile.
	self assert: ((fileStore packageDirectoriesIn: fileStore directory) includes: packageDir);
		assert: ((snapshot := fileStore captureLazySnapshot)
					includesObjectAt: 'src/Test.package');
		"assert: ((snapshot artifactAt: 'src/Test.package') storeInfo serializer = SquotCypressCodeSerializer)"
		assert: (snapshot artifactAt: 'src/Test.package') content startShadow class = SquotPackageShadow.