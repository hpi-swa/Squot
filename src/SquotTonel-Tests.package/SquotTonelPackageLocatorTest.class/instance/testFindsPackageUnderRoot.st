tests
testFindsPackageUnderRoot
	| artifactsFound |
	(rootDirectory / 'Xyz') ensureDirectory.
	(rootDirectory / 'Xyz' / 'package.st') ensureFile.
	artifactsFound := SquotFileSearchForArtifacts new
		visit: rootDirectory with: fileStore tonelPackageLocator;
		runSearch;
		artifactsFound.
	self assert: (artifactsFound anySatisfy: [:each | each path = 'Xyz']).