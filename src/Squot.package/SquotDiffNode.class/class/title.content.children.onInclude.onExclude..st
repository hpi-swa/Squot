instance creation
title: aStringOrText content: diffContent children: aCollectionOfDiffNodes onInclude: includeBlock onExclude: excludeBlock
	^ self new
		setTitle: aStringOrText content: diffContent children: aCollectionOfDiffNodes;
		includeBlock: includeBlock;
		excludeBlock: excludeBlock;
		yourself