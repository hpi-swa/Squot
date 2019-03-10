tests
testFindsPackageUnderRoot
	| artifactsFound |
	(rootDirectory / 'Xyz.package') ensureDirectory.
	(rootDirectory / 'Xyz.package' / '.filetree') ensureFile.
	artifactsFound := SquotFileSearchForArtifacts new
		visit: rootDirectory with: fileStore cypressPackageLocator;
		runSearch;
		artifactsFound.
	self assert: (artifactsFound anySatisfy: [:each | each path = 'Xyz.package']).