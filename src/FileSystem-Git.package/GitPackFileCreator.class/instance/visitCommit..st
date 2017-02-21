visiting
visitCommit: aCommit
	self 
		addObject: aCommit;
		visitTree: aCommit tree;
		visitCollection: aCommit parents