tests
testWriteDiffWithSingleTraitMethodAdded
	| directory packageInfo traitDef unchangedMethodDef originalArtifact changedArtifact readArtifact artifactModification traitDir theMethodFile unchangedMethodFile |
	"given"
	directory := self directoryForTests.
	originalArtifact := (MCSnapshot fromDefinitions:
				{traitDef := MCTraitDefinition name: 'TheTrait'
					superclassName: 'Object'
					category: 'Test Category' 
					instVarNames: #()
					comment: 'No comment'.
				unchangedMethodDef := MCMethodDefinition className: 'TheTrait'
					selector: 'unchangedMethod'
					category: 'tests'
					timeStamp: 'author 11/19/2021'
					source: 'unchangedMethod ^ 0'})
		asSquotArtifactForPackage: (packageInfo := PackageInfo new packageName: 'Test Category').
	(SquotCypressCodeSerializer writingBelow: directory) write: originalArtifact.
	changedArtifact := (MCSnapshot fromDefinitions:
		{traitDef. unchangedMethodDef.
		MCMethodDefinition className: 'TheTrait'
			selector: 'theMethod'
			category: 'tests'
			timeStamp: 'author 11/19/2021'
			source: 'theMethod ^ 42'})
		asSquotArtifactForPackage: packageInfo.
	artifactModification := originalArtifact diffAgainst: changedArtifact.
	traitDir := directory / 'Test Category.package' / 'TheTrait.trait'.
	theMethodFile := traitDir / 'instance' / 'theMethod.st'.
	unchangedMethodFile := traitDir / 'instance' / 'unchangedMethod.st'.
	directory fileSystem store resetObservations.
	"when"
	(SquotCypressCodeSerializer writingBelow: directory) writeDiff: artifactModification.
	"then"
	self assert: theMethodFile exists;
		assert: unchangedMethodFile exists;
		deny: (directory fileSystem store wasDeleted: unchangedMethodFile);
		deny: (directory fileSystem store wasOpened: unchangedMethodFile);
		assert: (directory fileSystem store wasOpened: traitDir / 'methodProperties.json');
		deny: (traitDir parent / 'TheTrait.extension') exists.
	readArtifact := originalArtifact copy.
	SquotCypressCodeDeserializer new fillContentOf: readArtifact from: directory / 'Test Category.package'.
	self assert: (readArtifact packageArtifactDefinitions anySatisfy: [:each | each source = 'theMethod ^ 42']);
		assert: (readArtifact packageArtifactDefinitions asSet = changedArtifact packageArtifactDefinitions asSet).