tests
testIgnoresCypressPackagesWithMethodNamedPackage
	| artifactsFound |
	(rootDirectory / 'Xyz.package' / 'A.class' / 'instance') ensureDirectory.
	(rootDirectory / 'Xyz.package' / 'A.class' / 'instance' / 'package.st') ensureFile.
	artifactsFound := SquotFileSearchForArtifacts new
		visit: rootDirectory with: fileStore tonelPackageLocator;
		runSearch;
		artifactsFound.
	self assert: artifactsFound isEmpty.