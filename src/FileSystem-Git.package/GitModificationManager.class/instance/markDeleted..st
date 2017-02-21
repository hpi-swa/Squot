accessing
markDeleted: aPath 
	^ self markDeleted: aPath 
		inTree: (self treeAt: aPath parent)