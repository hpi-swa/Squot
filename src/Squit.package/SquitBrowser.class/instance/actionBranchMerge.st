actions
actionBranchMerge
	| mergeHeadCommit |
	self projectSelection ifNil: [^ self].
	self branchSelection ifNil: [^ self].
	self commitSelection ifNil: [^ self].
	mergeHeadCommit := self branchSelection historian version.
	self mergeVersionIntoActiveBranch: mergeHeadCommit.