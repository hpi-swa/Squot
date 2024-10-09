actions
actionSwitchToActiveCommit
	self actionSwitchToCommit: (self activeCommitIfNilInformAnd: [^ self]).