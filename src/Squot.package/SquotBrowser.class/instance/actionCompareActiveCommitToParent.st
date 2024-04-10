actions
actionCompareActiveCommitToParent
	self actionCompareCommitToParent: (self activeCommitIfNilInformAnd: [^ self])