instance creation
of: leftArtifact
	^ self new
		diff: leftArtifact against: (SquotAbsentArtifact newFrom: leftArtifact);
		yourself