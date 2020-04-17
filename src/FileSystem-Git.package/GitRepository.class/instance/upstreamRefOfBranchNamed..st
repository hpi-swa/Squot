public-configuration
upstreamRefOfBranchNamed: aString
	self privateDeprecatedUseUnitOfWork.
	^ self configAt: 'branch.', aString, '.merge'