refs
headFSCommit
	^ self fsCommitFrom: (self headCommit ifNil: [^ nil])