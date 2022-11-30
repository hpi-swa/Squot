tests
testWriteDiffWithSingleMethodAdded
	| directory packageInfo classDef unchangedMethodDef originalArtifact changedArtifact readArtifact artifactModification classDir theMethodFile unchangedMethodFile |
	"given"
	directory := self directoryForTests.
	originalArtifact := (MCSnapshot fromDefinitions:
				{classDef := MCClassDefinition name: 'TheClass'
					superclassName: 'Object'
					category: 'Test Category' 
					instVarNames: #()
					comment: 'No comment'.
				unchangedMethodDef := MCMethodDefinition className: 'TheClass'
					selector: 'unchangedMethod'
					category: 'tests'
					timeStamp: 'author 11/19/2021'
					source: 'unchangedMethod ^ 0'})
		asSquotArtifactForPackage: (packageInfo := PackageInfo new packageName: 'Test Category').
	(SquotCypressCodeSerializer writingBelow: directory) write: originalArtifact.
	changedArtifact := (MCSnapshot fromDefinitions:
		{classDef. unchangedMethodDef.
		MCMethodDefinition className: 'TheClass'
			selector: 'theMethod'
			category: 'tests'
			timeStamp: 'author 11/19/2021'
			source: 'theMethod ^ 42'.})
		asSquotArtifactForPackage: packageInfo.
	artifactModification := originalArtifact diffAgainst: changedArtifact.
	classDir := directory / 'Test Category.package' / 'TheClass.class'.
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
		assert: (directory fileSystem store wasOpened: classDir / 'methodProperties.json');
		deny: (classDir parent / 'TheClass.extension') exists.
	readArtifact := originalArtifact copy.
	SquotCypressCodeDeserializer new fillContentOf: readArtifact from: directory / 'Test Category.package'.
	self assert: (readArtifact packageArtifactDefinitions anySatisfy: [:each | each source = 'theMethod ^ 42']);
		assert: (readArtifact packageArtifactDefinitions asSet = changedArtifact packageArtifactDefinitions asSet).