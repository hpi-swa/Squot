actions
actionResetToCommitAndRestoreIt: aCommit
	(self actionResetToCommit: aCommit) ifFalse: [^ self].
	self actionMaterializeCommit: self activeWorkingCopy headCommit "might not be aCommit, because of import".