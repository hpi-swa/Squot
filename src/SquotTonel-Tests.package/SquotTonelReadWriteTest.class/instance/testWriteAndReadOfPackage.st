tests
testWriteAndReadOfPackage
	| classFile readArtifact |
	serializer write: self sampleArtifact.
	classFile := rootDirectory
		resolve: 'src/', samplePackage name, '/', sampleClass name, '.class.st'.
	self assert: classFile exists description: 'class source not found'.
	readArtifact := self sampleArtifact.
	readArtifact content: nil.
	deserializer
		fillContentOf: readArtifact
		from: (rootDirectory resolve: sampleArtifactPath).
	self assert: (readArtifact shadowOfTrackedObject isKindOf: SquotPackageShadow);
		assert: samplePackage name
		equals: readArtifact shadowOfTrackedObject packageName;
		assert: (readArtifact shadowOfTrackedObject asMCSnapshot
					patchRelativeToBase:
						self sampleArtifactWithoutTimestamps shadowOfTrackedObject asMCSnapshot)
						isEmpty;
		deny: (readArtifact diffAgainst: self sampleArtifactWithoutTimestamps) hasChanges.