actions
actionResetToActiveCommitAndRestoreIt
	self actionResetToActiveCommit ifFalse: [^ self].
	self activeCommit: self activeRefCommit.
	self actionMaterializeActiveCommit.