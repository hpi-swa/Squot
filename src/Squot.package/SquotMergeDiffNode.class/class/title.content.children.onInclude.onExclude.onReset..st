instance creation
title: aStringOrText content: diffContent children: aCollectionOfDiffNodes onInclude: includeBlock onExclude: excludeBlock onReset: resetBlock
	^ self new
		setTitle: aStringOrText content: diffContent children: aCollectionOfDiffNodes;
		includeBlock: includeBlock;
		excludeBlock: excludeBlock;
		resetBlock: resetBlock;
		yourself