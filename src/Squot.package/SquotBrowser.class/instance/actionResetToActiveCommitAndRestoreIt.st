actions
actionResetToActiveCommitAndRestoreIt
	| commit |
	commit := self activeCommit.
	self actionResetToActiveCommit ifFalse: [^ self].
	self activeCommit: commit.
	self actionMaterializeActiveCommit.