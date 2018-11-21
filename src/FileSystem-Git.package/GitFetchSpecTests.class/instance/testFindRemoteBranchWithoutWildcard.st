testing
testFindRemoteBranchWithoutWildcard
	| fetchSpec |
	fetchSpec := GitFetchSpec fromString: '+refs/heads/master:refs/remotes/origin/master' forRemote: nil.
	self assert: 'refs/heads/master' equals: (fetchSpec remoteBranchOf: 'refs/remotes/origin/master').