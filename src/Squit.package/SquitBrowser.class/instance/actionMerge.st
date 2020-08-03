actions on versions
actionMerge
	self hasProjectSelection ifFalse: [^ self].
	self hasCommitSelection ifFalse: [^ self].
	[self withUnitOfWork:
		[self mergeCommit: self commitSelection into: self projectSelection]] fork.