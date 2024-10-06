actions
actionResetToActiveCommitAndRestoreIt
	self actionResetToCommitAndRestoreIt: (self activeCommitIfNilInformAnd: [^ self]).