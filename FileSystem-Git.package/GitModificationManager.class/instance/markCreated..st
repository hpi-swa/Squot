accessing
markCreated: aPath 
	^ self markCreated: aPath 
		inTree: (self treeAt: aPath parent)