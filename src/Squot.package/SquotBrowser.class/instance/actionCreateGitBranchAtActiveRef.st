actions
actionCreateGitBranchAtActiveRef
	^ self actionCreateGitBranchAtRef: (self activeRefIfNilInformAnd: [^ nil])