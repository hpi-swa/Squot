actions
actionResetToCommitAndRestoreIt: aCommit
	(self actionResetToCommit: aCommit) ifFalse: [^ self].
	self actionMaterializeCommit: aCommit.