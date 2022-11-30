tests
testWriteDiffWithClassWithoutMethods
	| directory packageInfo originalArtifact changedArtifact readArtifact artifactModification classDir |
	"given"
	directory := self directoryForTests.
	originalArtifact := (MCSnapshot fromDefinitions:
				{MCClassDefinition name: 'TheClass'
					superclassName: 'Object'
					category: 'Test Category' 
					instVarNames: #()
					comment: 'No comment'})
		asSquotArtifactForPackage: (packageInfo := PackageInfo new packageName: 'Test Category').
	(SquotCypressCodeSerializer writingBelow: directory) write: originalArtifact.
	changedArtifact := (MCSnapshot fromDefinitions:
				{MCClassDefinition name: 'TheClass'
					superclassName: 'Object'
					category: 'Test Category' 
					instVarNames: #()
					comment: 'Changed comment'})
		asSquotArtifactForPackage: packageInfo.
	artifactModification := originalArtifact diffAgainst: changedArtifact.
	classDir := directory / 'Test Category.package' / 'TheClass.class'.
	directory fileSystem store resetObservations.
	"when"
	(SquotCypressCodeSerializer writingBelow: directory) writeDiff: artifactModification.
	"then"
	self deny: (classDir parent / 'TheClass.extension') exists.
	readArtifact := originalArtifact copy.
	SquotCypressCodeDeserializer new fillContentOf: readArtifact from: directory / 'Test Category.package'.
	self assert: (readArtifact packageArtifactDefinitions anySatisfy: [:each | each isClassDefinition and: [each comment = 'Changed comment']]);
		assert: (readArtifact packageArtifactDefinitions asSet = changedArtifact packageArtifactDefinitions asSet).