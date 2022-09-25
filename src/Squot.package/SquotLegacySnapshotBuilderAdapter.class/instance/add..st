adding and removing
add: anArtifactSnapshot
	project putArtifact: anArtifactSnapshot artifact.
	artifactSnapshots putArtifact: anArtifactSnapshot.