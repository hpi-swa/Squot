accessing objects
artifactAt: path
	| artifact |
	artifact := store artifactAt: path ifAbsent: [self unloadedArtifacts at: path].
	^ SquotWorkingCopyArtifact wrapping: artifact in: self