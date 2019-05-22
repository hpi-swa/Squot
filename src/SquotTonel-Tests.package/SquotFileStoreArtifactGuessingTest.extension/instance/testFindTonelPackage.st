*SquotTonel-Tests-tests
testFindTonelPackage
	| packageDir snapshot |
	packageDir := fileStore directory / 'src' / 'Test'.
	packageDir ensureDirectory.
	(packageDir / 'package.st') ensureFile.
	self assert: ((snapshot := fileStore captureLazySnapshot)
					includesObjectAt: 'src/Test');
		assert: SquotTonelSerializer name
		equals: ((snapshot artifactAt: 'src/Test') storeInfo serializer);
		assert: ((snapshot artifactAt: 'src/Test') shadowOfTrackedObject respondsTo: #packageName)
		description: 'not a SquotPackageShadow'.