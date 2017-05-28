instance creation
left: leftArtifact right: rightArtifact base: baseArtifact
	^ self new
		diff: leftArtifact against: rightArtifact withBase: baseArtifact;
		yourself