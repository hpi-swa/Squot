actions
actionMaterializeActiveCommit
	self actionMaterializeCommit: (self activeCommitIfNilInformAnd: [^ self]).