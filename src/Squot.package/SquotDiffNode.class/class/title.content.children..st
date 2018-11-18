instance creation
title: aStringOrText content: diffContent children: aCollectionOfDiffNodes
	self deprecated.
	^ self new
		title: aStringOrText content: diffContent children: aCollectionOfDiffNodes;
		includeBlock: [];
		excludeBlock: [];
		yourself