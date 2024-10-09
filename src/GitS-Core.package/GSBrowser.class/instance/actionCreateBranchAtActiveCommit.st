actions
actionCreateBranchAtActiveCommit
	^ self actionCreateBranchAtCommit: (self activeCommitIfNilInformAnd: [^ self])