tests
testWriteAndReadOfPackage
	| classFile original readArtifact |
	original := self sampleArtifact.
	serializer write: original.
	classFile := rootDirectory
		resolve: 'src/', samplePackage name, '/', sampleClass name, '.class.st'.
	self assert: classFile exists description: 'class source not found'.
	readArtifact := original copyWithDifferentContent: nil.
	classFactory cleanUp.
	deserializer
		fillContentOf: readArtifact
		from: (rootDirectory resolve: sampleArtifactPath).
	self assert: (readArtifact shadowOfTrackedObject isKindOf: SquotPackageShadow);
		assert: samplePackage name
		equals: readArtifact shadowOfTrackedObject packageName;
		assert: (readArtifact shadowOfTrackedObject asMCSnapshot
					patchRelativeToBase:
						(self artifactWithoutTimestamps: original) shadowOfTrackedObject asMCSnapshot)
						isEmpty;
		deny: (readArtifact diffAgainst: (self artifactWithoutTimestamps: original)) hasChanges.