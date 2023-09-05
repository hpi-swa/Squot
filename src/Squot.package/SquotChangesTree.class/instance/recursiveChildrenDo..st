accessing
recursiveChildrenDo: aBlock
	self flatChildrenSorted do: [:each |
		each isTree
			ifTrue: [each recursiveChildrenDo: aBlock]
			ifFalse: [aBlock value: each]].