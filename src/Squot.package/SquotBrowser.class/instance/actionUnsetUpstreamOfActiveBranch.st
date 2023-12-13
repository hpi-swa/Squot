actions
actionUnsetUpstreamOfActiveBranch
	self activeRef ifNil: [^ self inform: 'Please select a branch first.'].
	self unitOfWork unsetUpstreamOfBranchNamed: self activeRef.