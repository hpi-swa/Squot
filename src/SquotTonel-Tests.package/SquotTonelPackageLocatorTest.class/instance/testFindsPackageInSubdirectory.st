tests
testFindsPackageInSubdirectory
	| artifactsFound |
	(rootDirectory / 'src' / 'Xyz') ensureDirectory.
	(rootDirectory / 'src' / 'Xyz' / 'package.st') ensureFile.
	artifactsFound := SquotFileSearchForArtifacts new
		visit: rootDirectory with: fileStore tonelPackageLocator;
		runSearch;
		artifactsFound.
	self assert: (artifactsFound anySatisfy: [:each | each path = 'src/Xyz']).