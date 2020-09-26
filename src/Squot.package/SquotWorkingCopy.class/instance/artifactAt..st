accessing objects
artifactAt: path
	| artifact |
	artifact := store artifactAt: path ifAbsent: [self unloadedArtifacts at: path].
	^ SquotLoadedArtifact wrapping: artifact in: self