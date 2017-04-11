ui
branchIndex: anIndex
	anIndex > 1 ifFalse: [^ self].
	branchIndex := anIndex.
	self refresh.