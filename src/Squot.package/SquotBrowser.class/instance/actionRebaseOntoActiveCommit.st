actions
actionRebaseOntoActiveCommit
	self actionRebaseOntoCommit: (self activeWorkingCopyIfNilInformAnd: [^ self]).