accessing
removeArtifact: anArtifact
	self addDiff: (SquotArtifactRemoval of: anArtifact).