public-configuration
upstreamRemoteOfBranchNamed: aString
	^ self configAt: 'branch.', aString, '.remote'