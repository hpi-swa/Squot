accessing objects
artifactAt: path
	| artifact |
	artifact := store artifactAt: path ifAbsent: [].
	^ artifact
		ifNotNil: [SquotLoadedArtifact wrapping: artifact in: self]
		ifNil: [SquotUnloadedArtifact wrapping: (self unloadedArtifacts at: path) in: self]