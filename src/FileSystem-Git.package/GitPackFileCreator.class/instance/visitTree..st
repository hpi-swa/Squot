visiting
visitTree: aTree
	(self includesObject: aTree) ifTrue: [^ self].
	self
		addObject: aTree; 
		visitCollection: aTree objects