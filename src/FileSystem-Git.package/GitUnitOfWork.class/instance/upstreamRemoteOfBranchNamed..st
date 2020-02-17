accessing
upstreamRemoteOfBranchNamed: aString
	^ self configAt: 'branch.', aString, '.remote'