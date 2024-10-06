actions
actionSwitchToActiveBranch
	self actionSwitchToBranch: (self activeRefIfNilInformAnd: [^ self]).