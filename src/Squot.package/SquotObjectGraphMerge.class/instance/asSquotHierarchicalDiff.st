*Squot-Tools
asSquotHierarchicalDiff
	self flag: #stub.
	self hasChanges ifFalse: [^ #()].
	^ SquotDiffTreeBuilder new
		graphDiff: self;
		convertToNodes: self