accessing
removeArtifact: anArtifact
	self deprecated: 'Inline this method instead'.
	self addDiff: (SquotArtifactRemoval of: anArtifact).