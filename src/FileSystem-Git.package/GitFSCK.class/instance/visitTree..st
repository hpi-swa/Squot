visiting
visitTree: aTree
	(self isReachable: aTree) ifTrue: [ ^ self ].
	
	self 
		mark: aTree;
		validate: aTree;
		visitCollection: aTree objects