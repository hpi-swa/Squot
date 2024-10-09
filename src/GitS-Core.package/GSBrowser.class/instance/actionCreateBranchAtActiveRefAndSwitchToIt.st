actions
actionCreateBranchAtActiveRefAndSwitchToIt
	self actionCreateBranchAtRefAndSwitchToIt: (self activeRefIfNilInformAnd: [^ self]).