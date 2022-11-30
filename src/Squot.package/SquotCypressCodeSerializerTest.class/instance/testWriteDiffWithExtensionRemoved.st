tests
testWriteDiffWithExtensionRemoved
	| directory packageInfo unchangedMethodDef unchangedClassDef originalArtifact changedArtifact readArtifact artifactModification classDir theMethodFile unchangedMethodFile unchangedClassFile |
	"given"
	directory := self directoryForTests.
	originalArtifact := (MCSnapshot fromDefinitions:
				{MCMethodDefinition className: 'TheClass'
					selector: 'theMethod'
					category: '*Test Category'
					timeStamp: 'author 11/19/2021'
					source: 'theMethod ^ 42'.
				unchangedMethodDef := MCMethodDefinition className: 'UnchangedClass'
					selector: 'unchangedMethod'
					category: '*Test Category'
					timeStamp: 'author 11/19/2021'
					source: 'unchangedMethod ^ 0'.
				unchangedClassDef := MCClassDefinition name: 'EmptyClass'
					superclassName: 'Object'
					category: 'Test Category' 
					instVarNames: #()
					comment: 'No comment'})
		asSquotArtifactForPackage: (packageInfo := PackageInfo new packageName: 'Test Category').
	(SquotCypressCodeSerializer writingBelow: directory) write: originalArtifact.
	changedArtifact := (MCSnapshot fromDefinitions: {unchangedMethodDef. unchangedClassDef})
		asSquotArtifactForPackage: packageInfo.
	artifactModification := originalArtifact diffAgainst: changedArtifact.
	classDir := directory / 'Test Category.package' / 'TheClass.extension'.
	theMethodFile := classDir / 'instance' / 'theMethod.st'.
	unchangedMethodFile := directory / 'Test Category.package' / 'UnchangedClass.extension' / 'instance' / 'unchangedMethod.st'.
	unchangedClassFile := directory / 'Test Category.package' / 'EmptyClass.class' / 'methodProperties.json'.
	directory fileSystem store resetObservations.
	"when"
	(SquotCypressCodeSerializer writingBelow: directory) writeDiff: artifactModification.
	"then"
	self deny: classDir exists;
		assert: unchangedMethodFile exists;
		assert: unchangedClassFile exists;
		deny: (directory fileSystem store wasDeleted: unchangedMethodFile);
		deny: (directory fileSystem store wasOpened: unchangedMethodFile);
		deny: (directory fileSystem store wasDeleted: unchangedClassFile);
		deny: (directory fileSystem store wasOpened: unchangedClassFile);
		deny: (classDir parent / 'TheClass.class') exists.
	readArtifact := originalArtifact copy.
	SquotCypressCodeDeserializer new fillContentOf: readArtifact from: directory / 'Test Category.package'.
	self deny: (readArtifact packageArtifactDefinitions anySatisfy: [:each | each source = 'theMethod ^ 42']);
		assert: (readArtifact packageArtifactDefinitions asSet = changedArtifact packageArtifactDefinitions asSet).