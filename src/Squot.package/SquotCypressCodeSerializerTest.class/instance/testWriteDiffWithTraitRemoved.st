tests
testWriteDiffWithTraitRemoved
	| directory packageInfo traitDef unchangedTraitDef originalArtifact changedArtifact readArtifact artifactModification traitDir unchangedTraitFile |
	"given"
	directory := self directoryForTests.
	originalArtifact := (MCSnapshot fromDefinitions:
				{traitDef := MCTraitDefinition name: 'TheTrait'
					superclassName: 'Object'
					category: 'Test Category' 
					instVarNames: #()
					comment: 'No comment'.
				MCMethodDefinition className: 'TheTrait'
					selector: 'theMethod'
					category: 'tests'
					timeStamp: 'author 11/19/2021'
					source: 'theMethod ^ 42'.
				unchangedTraitDef := MCTraitDefinition name: 'UnchangedTrait'
					superclassName: 'Object'
					category: 'Test Category' 
					instVarNames: #()
					comment: 'No comment'})
		asSquotArtifactForPackage: (packageInfo := PackageInfo new packageName: 'Test Category').
	(SquotCypressCodeSerializer writingBelow: directory) write: originalArtifact.
	changedArtifact := (MCSnapshot fromDefinitions: {unchangedTraitDef})
		asSquotArtifactForPackage: packageInfo.
	artifactModification := originalArtifact diffAgainst: changedArtifact.
	traitDir := directory / 'Test Category.package' / 'TheTrait.trait'.
	unchangedTraitFile := directory / 'Test Category.package' / 'UnchangedTrait.trait' / 'methodProperties.json'.
	directory fileSystem store resetObservations.
	"when"
	(SquotCypressCodeSerializer writingBelow: directory) writeDiff: artifactModification.
	"then"
	self deny: traitDir exists;
		assert: unchangedTraitFile exists;
		deny: (directory fileSystem store wasDeleted: unchangedTraitFile);
		deny: (directory fileSystem store wasOpened: unchangedTraitFile);
		deny: (traitDir parent / 'TheTrait.extension') exists.
	readArtifact := originalArtifact copy.
	SquotCypressCodeDeserializer new fillContentOf: readArtifact from: directory / 'Test Category.package'.
	self deny: (readArtifact packageArtifactDefinitions anySatisfy: [:each | each isTraitDefinition and: [each className = 'TheTrait']]);
		assert: (readArtifact packageArtifactDefinitions asSet = changedArtifact packageArtifactDefinitions asSet).