tests
testFindCypressPackage
	| packageDir snapshot |
	packageDir := fileStore directory / 'src' / 'Test.package'.
	packageDir ensureDirectory.
	(packageDir / '.filetree') ensureFile.
	self assert: ((snapshot := fileStore captureLazySnapshot)
					includesObjectAt: 'src/Test.package');
		assert: SquotCypressCodeSerializer name
		equals: ((snapshot artifactAt: 'src/Test.package') storeInfo serializer);
		assert: ((snapshot artifactAt: 'src/Test.package') content startShadow respondsTo: #packageName)
		description: 'not a SquotPackageShadow'.