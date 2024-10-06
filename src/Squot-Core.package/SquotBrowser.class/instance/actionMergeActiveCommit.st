actions
actionMergeActiveCommit
	self actionMergeCommit: (self activeCommitIfNilInformAnd: [^ self]).