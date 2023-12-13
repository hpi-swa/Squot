actions
actionSetUpstreamOfActiveBranch
	self activeRef ifNil: [^ self inform: 'Please select a branch first.'].
	self activeWorkingCopy setUpstreamRemoteNameAndRefFor: self activeRef.