remotes
upstreamRefOfBranchNamed: aString
	^ self configAt: 'branch.', aString, '.merge'