public-accessing-references
setUpstreamOfBranchNamed: branchNameString toTrackedBranchOf: remoteTrackingBranchString
	| fetchSpec |
	fetchSpec := self fetchSpecOfTrackingBranch: remoteTrackingBranchString.
	fetchSpec ifNil: [^ self error: 'There is no remote tracked by ', remoteTrackingBranchString].
	self setUpstreamRemoteOfBranchNamed: branchNameString to: fetchSpec remote name.
	self setUpstreamRefOfBranchNamed: branchNameString
		to: (fetchSpec remoteBranchOf: remoteTrackingBranchString).