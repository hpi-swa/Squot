tests
testFindsMultiplePackages
	| artifactsFound |
	"given"
	#('X' 'Y')
		do: [:each | (rootDirectory / each) ensureDirectory.
					(rootDirectory / each / 'package.st') ensureFile ].
	"decoys"
	(rootDirectory / 'WithoutPackageSt') ensureDirectory.
	"when"
	artifactsFound := SquotFileSearchForArtifacts new
		visit: rootDirectory with: fileStore tonelPackageLocator;
		runSearch;
		artifactsFound.
	"then"
	self assert: (artifactsFound anySatisfy: [:each | each path = 'X']);
		assert: (artifactsFound anySatisfy: [:each | each path = 'Y']);
		assert: artifactsFound size = 2.