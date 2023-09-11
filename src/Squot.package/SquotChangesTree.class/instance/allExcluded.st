accessing
allExcluded
	self recursiveChildrenDo: [:each | each isExcluded ifFalse: [^ false]].
	^ true