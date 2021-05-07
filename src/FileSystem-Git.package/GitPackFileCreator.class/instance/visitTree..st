visiting
visitTree: aTree
	((self includesObject: aTree) or: [self excludesObject: aTree]) ifTrue: [^ self].
	self
		addObject: aTree; 
		visitCollection: aTree objects