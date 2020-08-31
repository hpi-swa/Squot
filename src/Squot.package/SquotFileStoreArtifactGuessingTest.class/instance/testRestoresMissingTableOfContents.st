tests
testRestoresMissingTableOfContents
	| packageArtifact |
	packageArtifact := (MCSnapshot fromDefinitions: {MCPostscriptDefinition script: '' packageName: 'A'}) asSquotArtifactForPackage: (PackageInfo new packageName: 'A'; yourself).
	fileStore doStoreMetadata.
	fileStore add: packageArtifact.
	self assert: fileStore tableOfContents exists.
	"when"
	fileStore tableOfContents delete.
	self shouldnt:
			[fileStore removeAt: packageArtifact path.
			fileStore add: packageArtifact.
			fileStore tableOfContents delete.
			fileStore add: (MCSnapshot empty asSquotArtifactForPackage: (PackageInfo new packageName: 'B'; yourself))]
		raise: Error.
	"then"
	self assert: fileStore tableOfContents exists;
		assert: (fileStore artifactAt: packageArtifact path ifAbsent: []) notNil.