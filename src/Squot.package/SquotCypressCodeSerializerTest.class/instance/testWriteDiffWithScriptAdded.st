tests
testWriteDiffWithScriptAdded
	| directory packageInfo unchangedScriptDef originalArtifact changedArtifact readArtifact artifactModification scriptDir theScriptFile unchangedScriptFile |
	"given"
	directory := self directoryForTests.
	originalArtifact := (MCSnapshot fromDefinitions:
				{unchangedScriptDef := MCPreambleDefinition script: 'Transcript show: 0' packageName: 'Test Category'})
		asSquotArtifactForPackage: (packageInfo := PackageInfo new packageName: 'Test Category').
	(SquotCypressCodeSerializer writingBelow: directory) write: originalArtifact.
	changedArtifact := (MCSnapshot fromDefinitions:
		{unchangedScriptDef.
		MCPostscriptDefinition script: 'Transcript show: 42' packageName: 'Test Category'})
		asSquotArtifactForPackage: packageInfo.
	artifactModification := originalArtifact diffAgainst: changedArtifact.
	scriptDir := directory / 'Test Category.package' / 'monticello.meta'.
	theScriptFile :=  scriptDir / 'postscript.st'.
	unchangedScriptFile := scriptDir / 'preamble.st'.
	directory fileSystem store resetObservations.
	"when"
	(SquotCypressCodeSerializer writingBelow: directory) writeDiff: artifactModification.
	"then"
	self assert: theScriptFile exists;
		assert: unchangedScriptFile exists;
		deny: (directory fileSystem store wasDeleted: unchangedScriptFile);
		deny: (directory fileSystem store wasOpened: unchangedScriptFile).
	readArtifact := originalArtifact copy.
	SquotCypressCodeDeserializer new fillContentOf: readArtifact from: directory / 'Test Category.package'.
	self assert: (readArtifact packageArtifactDefinitions anySatisfy: [:each | each source = 'Transcript show: 42']);
		assert: (readArtifact packageArtifactDefinitions asSet = changedArtifact packageArtifactDefinitions asSet).