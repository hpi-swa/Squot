test data
sampleArtifactWithoutTimestamps
	| artifact |
	artifact := self sampleArtifact.
	artifact shadowOfTrackedObject
		setPackageName: samplePackage name
		snapshot: (self withoutTimestamps: artifact shadowOfTrackedObject asMCSnapshot)
		tonelProperties: Dictionary new.
	^ artifact