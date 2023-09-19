accessing
activeWorkingCopy: aWorkingCopy
	activeWorkingCopy ifNotNil: [activeWorkingCopy removeDependent: self].
	activeWorkingCopy := aWorkingCopy.
	activeWorkingCopy ifNotNil: [activeWorkingCopy addDependent: self].
	self
		changed: #activeProject;
		changed: #refList;
		changed: #commitList.
	self activeRef: nil.
	self activeCommit: (self activeWorkingCopy ifNotNil: #headCommit).