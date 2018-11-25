diff creation
diff: leftArtifact against: rightArtifact

	self
		left: leftArtifact;
		right: rightArtifact.
	self
		added: (self right shadows keys difference: self left shadows keys);
		stayed: (self right shadows keys intersection: self left shadows keys);
		removed: (self left shadows keys difference: self right shadows keys).
	self modified: (self stayed select: [:each | self isFileModified: each]).
	self stayed: (self stayed difference: self modified).
	self
		createDiffs.
	self halt.