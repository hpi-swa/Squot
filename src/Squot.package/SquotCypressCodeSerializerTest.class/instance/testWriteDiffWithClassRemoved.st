tests
testWriteDiffWithClassRemoved
	| directory packageInfo classDef unchangedClassDef originalArtifact changedArtifact readArtifact artifactModification classDir unchangedClassFile |
	"given"
	directory := self directoryForTests.
	originalArtifact := (MCSnapshot fromDefinitions:
				{classDef := MCClassDefinition name: 'TheClass'
					superclassName: 'Object'
					category: 'Test Category' 
					instVarNames: #()
					comment: 'No comment'.
				MCMethodDefinition className: 'TheClass'
					selector: 'theMethod'
					category: 'tests'
					timeStamp: 'author 11/19/2021'
					source: 'theMethod ^ 42'.
				unchangedClassDef := MCClassDefinition name: 'UnchangedClass'
					superclassName: 'Object'
					category: 'Test Category' 
					instVarNames: #()
					comment: 'No comment'})
		asSquotArtifactForPackage: (packageInfo := PackageInfo new packageName: 'Test Category').
	(SquotCypressCodeSerializer writingBelow: directory) write: originalArtifact.
	changedArtifact := (MCSnapshot fromDefinitions: {unchangedClassDef})
		asSquotArtifactForPackage: packageInfo.
	artifactModification := originalArtifact diffAgainst: changedArtifact.
	classDir := directory / 'Test Category.package' / 'TheClass.class'.
	unchangedClassFile := directory / 'Test Category.package' / 'UnchangedClass.class' / 'methodProperties.json'.
	directory fileSystem store resetObservations.
	"when"
	(SquotCypressCodeSerializer writingBelow: directory) writeDiff: artifactModification.
	"then"
	self deny: classDir exists;
		assert: unchangedClassFile exists;
		deny: (directory fileSystem store wasDeleted: unchangedClassFile);
		deny: (directory fileSystem store wasOpened: unchangedClassFile);
		deny: (classDir parent / 'TheClass.extension') exists.
	readArtifact := originalArtifact copy.
	SquotCypressCodeDeserializer new fillContentOf: readArtifact from: directory / 'Test Category.package'.
	self deny: (readArtifact packageArtifactDefinitions anySatisfy: [:each | each isClassDefinition and: [each className = 'TheClass']]);
		assert: (readArtifact packageArtifactDefinitions asSet = changedArtifact packageArtifactDefinitions asSet).