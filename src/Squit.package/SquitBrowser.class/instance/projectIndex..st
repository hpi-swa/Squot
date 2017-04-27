ui
projectIndex: anIndex
	anIndex > 1 ifFalse: [^ self].
	projectIndex := anIndex.
	repositoryExists := self projectSelection repository exists.
	branchIndex := self branchDefaultIndex.
	commitSelection := nil.
	repositoryExists ifFalse: [self informThatProjectDoesNotExist].
	self refresh.