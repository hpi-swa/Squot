instance creation
left: leftArtifact right: rightArtifact
	^ self new
		diff: leftArtifact against: rightArtifact;
		yourself