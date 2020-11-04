instance creation
of: anUnloadedArtifact
	^ self new
		diff: anUnloadedArtifact against: anUnloadedArtifact;
		yourself