accessing
addArtifact: anArtifact
	self deprecated: 'Inline this method instead'.
	self addDiff: (SquotArtifactAddition of: anArtifact).