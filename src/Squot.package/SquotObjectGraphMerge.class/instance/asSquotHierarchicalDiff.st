*Squot-Tools
asSquotHierarchicalDiff
	self flag: #stub.
	^ SquotDiffTreeBuilder new
		graphDiff: self;
		convertToNodes: self