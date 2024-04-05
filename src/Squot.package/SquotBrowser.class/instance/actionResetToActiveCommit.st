actions
actionResetToActiveCommit
	^ self actionResetToCommit: (self activeCommitIfNilInformAnd: [^ false])