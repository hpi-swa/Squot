tests
testWriteAndReadOfPackageWithTimestamps
	| original shadow readArtifact |
	original := self sampleArtifact.
	classFactory cleanUp.
	original := original copyWithDifferentContent:
		(SquotShadowGraph withSingleShadow:
			((shadow := original shadowOfTrackedObject) copy
				setPackageName: shadow packageName snapshot: shadow asMCSnapshot tonelProperties: (shadow tonelProperties at: TonelWriter squeakChangestamp put: true; yourself))).
	"Full roundtrip: write-read-write-read."
	serializer write: original.
	readArtifact := original copyWithDifferentContent: nil.
	deserializer
		fillContentOf: readArtifact
		from: (rootDirectory resolve: sampleArtifactPath).
	serializer write: readArtifact.
	readArtifact content: nil.
	deserializer
		fillContentOf: readArtifact
		from: (rootDirectory resolve: sampleArtifactPath).
	self assert: (readArtifact shadowOfTrackedObject asMCSnapshot
					patchRelativeToBase:
						original shadowOfTrackedObject asMCSnapshot)
						isEmpty;
		deny: (readArtifact diffAgainst: original) hasChanges.