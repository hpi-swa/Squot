instance creation
forArtifact: anArtifact
	^ self new
		setProject: nil artifactSnapshots: #();
		yourself