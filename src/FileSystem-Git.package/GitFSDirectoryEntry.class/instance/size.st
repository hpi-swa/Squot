accessing
size
	size ~~ self class sizeNotComputedYet ifTrue: [^ size].
	size := treeEntry hasSize
		ifTrue: [unitOfWork sizeOfObjectNamed: treeEntry entryHash]
		ifFalse: [0].
	^ size