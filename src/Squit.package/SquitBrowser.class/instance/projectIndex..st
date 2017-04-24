ui
projectIndex: anIndex
	anIndex > 1 ifFalse: [^ self].
	projectIndex := anIndex.
	branchIndex := self branchDefaultIndex.
	commitSelection := nil.
	self refresh.