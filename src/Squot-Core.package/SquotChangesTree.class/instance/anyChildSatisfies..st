accessing
anyChildSatisfies: aBlock
	self recursiveChildrenDo: [:each | (aBlock value: each) ifTrue: [^ true]].
	^ false