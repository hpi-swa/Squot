public
addArtifact: anArtifact
	self addDiff: (SquotArtifactAddition of: anArtifact).
	loadOrderDiff := nil.