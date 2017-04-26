public-configuration
setUpstreamRefOfBranchNamed: branchName to: aString
	^ self configAt: 'branch.', branchName, '.merge' put: aString