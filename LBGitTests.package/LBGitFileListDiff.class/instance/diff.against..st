as yet unclassified
diff: leftArtifact against: rightArtifact

	self
		left: leftArtifact;
		right: rightArtifact.
	self
		added: (self right shadows keys difference: self left shadows keys);
		stayed: (self right shadows keys intersection: self left shadows keys);
		removed: (self left shadows keys difference: self right shadows keys).
	self halt.