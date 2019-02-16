as yet unclassified
sampleArtifactWithoutTimestamps
	| artifact |
	artifact := self sampleArtifact.
	artifact shadowOfTrackedObject
		packageName: samplePackage name
		snapshot: (self withoutTimestamps: artifact shadowOfTrackedObject asMCSnapshot).
	^ artifact