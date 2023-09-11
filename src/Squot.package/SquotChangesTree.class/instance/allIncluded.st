accessing
allIncluded
	self recursiveChildrenDo: [:each | each isIncluded ifFalse: [^ false]].
	^ true