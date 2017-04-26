public-configuration
upstreamRefOfBranchNamed: aString
	^ self configAt: 'branch.', aString, '.merge'