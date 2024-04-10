actions
actionSetUpstreamOfActiveBranch
	self actionSetUpstreamOfBranch: (self activeRefIfNilInformAnd: [^ self]).