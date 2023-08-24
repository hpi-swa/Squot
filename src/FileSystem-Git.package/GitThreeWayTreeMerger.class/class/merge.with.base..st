instance creation
merge: leftTree with: rightTree base: baseTree
	^ self new
		left: leftTree;
		right: rightTree;
		base: baseTree;
		merge;
		yourself