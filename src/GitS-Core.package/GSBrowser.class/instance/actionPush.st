actions
actionPush
	self activeWorkingCopyIfNilInformAnd: [^ self].
	self actionPush: (self currentBranchIfNilInformAnd: [^ self]).