actions
actionCreateGitBranchAtActiveCommit
	^ self actionCreateGitBranchAtCommit: (self activeCommitIfNilInformAnd: [^ nil])