actions
actionForcePush
	self activeWorkingCopyIfNilInformAnd: [^ self].
	self actionForcePush: (self currentBranchIfNilInformAnd: [^ self]).