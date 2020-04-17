public-configuration
setUpstreamRemoteOfBranchNamed: branchName to: remoteName
	self privateDeprecatedUseUnitOfWork.
	^ self configAt: 'branch.', branchName, '.remote' put: remoteName