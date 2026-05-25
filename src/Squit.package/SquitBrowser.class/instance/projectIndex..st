ui
projectIndex: anIndex
	anIndex > 1 ifFalse: [^ self].
	projectIndex := anIndex.
	self updateProjectSelection.