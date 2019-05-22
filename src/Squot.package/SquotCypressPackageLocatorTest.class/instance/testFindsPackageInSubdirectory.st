tests
testFindsPackageInSubdirectory
	| artifactsFound |
	(rootDirectory / 'src' / 'Xyz.package') ensureDirectory.
	(rootDirectory / 'src' / 'Xyz.package' / '.filetree') ensureFile.
	artifactsFound := SquotFileSearchForArtifacts new
		visit: rootDirectory with: fileStore cypressPackageLocator;
		runSearch;
		artifactsFound.
	self assert: (artifactsFound anySatisfy: [:each | each path = 'src/Xyz.package']).