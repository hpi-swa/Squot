instance creation
of: rightArtifact
	^ self new
		diff: (SquotAbsentArtifact newFrom: rightArtifact) against: rightArtifact;
		yourself