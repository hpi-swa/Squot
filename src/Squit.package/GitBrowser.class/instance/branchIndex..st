accessing
branchIndex: anIndex
	anIndex > 1 ifFalse: [^ self].
	branchIndex := anIndex.
	self changed: #branchIndex.
	self changed: #commitList.
	self changed: #contents.
	self changed: #objectList.