accessing artifacts
readArtifact: anArtifact
	^ SquotArtifactSnapshot artifact: anArtifact objectSnapshot: (artifactSnapshots at: anArtifact id) objectSnapshot