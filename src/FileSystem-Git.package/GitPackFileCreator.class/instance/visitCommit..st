visiting
visitCommit: aCommit
	(self includesObject: aCommit) ifTrue: [^ self].
	self 
		addObject: aCommit;
		visitTree: aCommit tree;
		visitCollection: aCommit parents