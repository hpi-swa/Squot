accessing
addArtifact: anArtifact
	self addDiff: (SquotArtifactAddition of: anArtifact).
	loadOrderMerge := nil.