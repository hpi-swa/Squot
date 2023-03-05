tests
testArtifactMetadataFileIsStable
	"When an artifact is written repeatedly with equal metadata, the metadata file should not change either (e. g. due to reordering of properties)."
	| metadata artifact fileContents metadataFile project |
	metadata := SquotTrackedObjectMetadata withNewIdCypressPackageNamed: 'Foo' underPath: 'src'.
	"Turn OrderedDictionary into Dictionary, which would not preserve the order on its own."
	(metadata at: 'references') first value: (Dictionary newFrom: (metadata at: 'references') first value).
	artifact := SquotArtifact storeInfo: metadata.
	project := SquotProject id: UUID new metadata: Dictionary new artifacts: (OrderedDictionary with: metadata id -> artifact).
	(fileStore directory / 'src' / 'Foo.package') ensureDirectory.
	fileStore writeProject: project.
	metadataFile := fileStore directory / 'src' / 'Foo.package' / '.squot-contents'.
	fileContents := metadataFile contents.
	3 timesRepeat:
		[| read | read := fileStore readProject.
		self assert: metadata equals: (read artifacts at: metadata id) storeInfo.
		fileStore writeProject: read.
		self assert: fileContents equals: metadataFile contents].