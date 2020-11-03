accessing
addArtifact: anArtifact
	self addDiff: (SquotArtifactAddition of: anArtifact).
	loadOrderDiff := nil.
	loadOrderMerge := nil.