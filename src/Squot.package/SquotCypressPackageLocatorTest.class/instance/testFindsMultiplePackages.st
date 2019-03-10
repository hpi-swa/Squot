tests
testFindsMultiplePackages
	| artifactsFound |
	"given"
	#('X.package' 'Y.package')
		do: [:each | (rootDirectory / each) ensureDirectory.
					(rootDirectory / each / '.filetree') ensureFile ].
	"decoys"
	(rootDirectory / 'Z.package') ensureDirectory.
	(rootDirectory / 'NoPackageExtension') ensureDirectory.
	(rootDirectory / 'NoPackageExtension' / '.filetree') ensureFile.
	"when"
	artifactsFound := SquotFileSearchForArtifacts new
		visit: rootDirectory with: fileStore cypressPackageLocator;
		runSearch;
		artifactsFound.
	"then"
	self assert: (artifactsFound anySatisfy: [:each | each path = 'X.package']);
		assert: (artifactsFound anySatisfy: [:each | each path = 'Y.package']);
		assert: artifactsFound size = 2.