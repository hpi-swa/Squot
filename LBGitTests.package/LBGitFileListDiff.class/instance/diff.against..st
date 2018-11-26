diff creation
diff: leftArtifact against: rightArtifact

	self
		left: leftArtifact;
		right: rightArtifact.
	self
		added: (self right trackedFiles keys difference: self left trackedFiles keys);
		stayed: (self right trackedFiles keys intersection: self left trackedFiles keys);
		removed: (self left trackedFiles keys difference: self right trackedFiles keys).
	self modified: (self stayed select: [:each | self isFileModified: each]).
	self stayed: (self stayed difference: self modified).
	self
		createDiffs.