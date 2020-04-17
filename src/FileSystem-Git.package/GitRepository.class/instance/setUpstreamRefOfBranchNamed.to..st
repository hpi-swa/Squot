public-configuration
setUpstreamRefOfBranchNamed: branchName to: aString
	self privateDeprecatedUseUnitOfWork.
	self validateReferenceOrReferenceName: aString.
	^ self configAt: 'branch.', branchName, '.merge' put: aString