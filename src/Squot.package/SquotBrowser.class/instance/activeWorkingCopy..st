accessing
activeWorkingCopy: aWorkingCopy
	activeWorkingCopy == aWorkingCopy ifTrue: [^ self].
	activeWorkingCopy ifNotNil: [activeWorkingCopy removeDependent: self].
	activeWorkingCopy := aWorkingCopy.
	activeWorkingCopy ifNotNil: [activeWorkingCopy addDependent: self].
	self
		changed: #activeWorkingCopy;
		changed: #refList;
		changed: #commitList.
	self activeRef: nil.
	self activeCommit: (self activeWorkingCopy ifNotNil: #headCommit).