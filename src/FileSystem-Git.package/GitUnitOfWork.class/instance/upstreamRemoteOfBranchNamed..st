remotes
upstreamRemoteOfBranchNamed: aString
	^ self configAt: 'branch.', aString, '.remote'