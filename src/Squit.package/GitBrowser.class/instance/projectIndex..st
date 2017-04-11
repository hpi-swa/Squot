accessing
projectIndex: anIndex
	anIndex > 1 ifFalse: [^ self].
	projectIndex := anIndex.
	self changed: #projectIndex.
	self changed: #branchList.
	self changed: #commitList.
	self changed: #contents.
	self changed: #objectList.