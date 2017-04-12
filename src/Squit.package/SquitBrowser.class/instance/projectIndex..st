ui
projectIndex: anIndex
	anIndex > 1 ifFalse: [^ self].
	projectIndex := anIndex.
	branchIndex := self branchDefaultIndex.
	self refresh.