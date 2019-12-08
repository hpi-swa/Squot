accessing objects
artifactAt: path
	^ SquotWorkingCopyArtifact wrapping: (store artifactAt: path) in: self