excluding
toggleExcluded
	self isExcluded
		ifTrue: [self include]
		ifFalse: [self exclude].