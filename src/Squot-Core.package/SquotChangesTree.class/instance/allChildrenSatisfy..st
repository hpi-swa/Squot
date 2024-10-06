accessing
allChildrenSatisfy: aBlock
	self recursiveChildrenDo: [:each | (aBlock value: each) ifFalse: [^ false]].
	^ true