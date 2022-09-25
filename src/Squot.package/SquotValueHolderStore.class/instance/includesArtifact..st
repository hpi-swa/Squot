accessing artifacts
includesArtifact: anArtifact
	^ holder contents notNil and: [artifact id = anArtifact id]