public-configuration
setUpstreamRefOfBranchNamed: branchName to: aString
	self validateReferenceName: aString.
	^ self configAt: 'branch.', branchName, '.merge' put: aString