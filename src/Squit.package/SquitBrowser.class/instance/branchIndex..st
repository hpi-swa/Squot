ui
branchIndex: anIndex
	anIndex > 1 ifFalse: [^ self].
	branchIndex := anIndex.
	commitSelection := nil.
	self refresh.