private loading
environmentForLoadedArtifact: anArtifact
	^ ((additionalInfo at: anArtifact path ifAbsent: [^ Environment current])
		at: #environment ifAbsent: [Environment current])