accessing objects
artifacts
	^ store artifacts collect: [:each | SquotWorkingCopyArtifact wrapping: each in: self]