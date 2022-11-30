tests
testWriteDiffWithSingleExtensionMethodChanged
	| directory packageInfo unchangedMethodDef originalArtifact changedArtifact readArtifact artifactModification classDir theMethodFile unchangedMethodFile |
	"given"
	directory := self directoryForTests.
	originalArtifact := (MCSnapshot fromDefinitions:
				{MCMethodDefinition className: 'TheClass'
					selector: 'theMethod'
					category: '*Test Category'
					timeStamp: 'author 11/19/2021'
					source: 'theMethod ^ 42'.
				unchangedMethodDef := MCMethodDefinition className: 'TheClass'
					selector: 'unchangedMethod'
					category: '*Test Category'
					timeStamp: 'author 11/19/2021'
					source: 'unchangedMethod ^ 0'})
		asSquotArtifactForPackage: (packageInfo := PackageInfo new packageName: 'Test Category').
	(SquotCypressCodeSerializer writingBelow: directory) write: originalArtifact.
	changedArtifact := (MCSnapshot fromDefinitions:
				{unchangedMethodDef.
				MCMethodDefinition className: 'TheClass'
					selector: 'theMethod'
					category: '*Test Category'
					timeStamp: 'author 11/19/2021'
					source: 'theMethod ^ #pi'})
		asSquotArtifactForPackage: packageInfo.
	artifactModification := originalArtifact diffAgainst: changedArtifact.
	classDir := directory / 'Test Category.package' / 'TheClass.extension'.
	theMethodFile := classDir / 'instance' / 'theMethod.st'.
	unchangedMethodFile := classDir / 'instance' / 'unchangedMethod.st'.
	directory fileSystem store resetObservations.
	"when"
	(SquotCypressCodeSerializer writingBelow: directory) writeDiff: artifactModification.
	"then"
	self assert: theMethodFile exists;
		assert: unchangedMethodFile exists;
		deny: (directory fileSystem store wasDeleted: unchangedMethodFile);
		deny: (directory fileSystem store wasOpened: unchangedMethodFile);
		assert: (directory fileSystem store wasOpened: theMethodFile);
		assert: (directory fileSystem store wasOpened: classDir / 'methodProperties.json');
		deny: (classDir parent / 'TheClass.class') exists.
	readArtifact := originalArtifact copy.
	SquotCypressCodeDeserializer new fillContentOf: readArtifact from: directory / 'Test Category.package'.
	self assert: (readArtifact packageArtifactDefinitions anySatisfy: [:each | each source = 'theMethod ^ #pi']);
		assert: (readArtifact packageArtifactDefinitions asSet = changedArtifact packageArtifactDefinitions asSet).