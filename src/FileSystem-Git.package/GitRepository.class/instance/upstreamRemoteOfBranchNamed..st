public-configuration
upstreamRemoteOfBranchNamed: aString
	self privateDeprecatedUseUnitOfWork.
	^ self configAt: 'branch.', aString, '.remote'