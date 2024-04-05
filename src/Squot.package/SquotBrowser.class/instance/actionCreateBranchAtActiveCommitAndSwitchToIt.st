actions
actionCreateBranchAtActiveCommitAndSwitchToIt
	self actionCreateBranchAtCommitAndSwitchToIt: (self activeCommitIfNilInformAnd: [^ self]).