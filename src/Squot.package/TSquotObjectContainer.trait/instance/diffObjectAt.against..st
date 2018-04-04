comparing
diffObjectAt: path against: anArtifact
	^ self artifactAt: path
		ifPresent: [:myArtifact | myArtifact diffAgainst: anArtifact]
		ifAbsent: [SquotArtifactAddition of: anArtifact].