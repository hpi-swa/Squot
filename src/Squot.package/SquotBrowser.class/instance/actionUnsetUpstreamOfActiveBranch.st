actions
actionUnsetUpstreamOfActiveBranch
	self actionUnsetUpstreamOfBranch: (self activeRefIfNilInformAnd: [^ self]).