testing
testFindRemoteBranchWithSuffix
	| fetchSpec |
	fetchSpec := GitFetchSpec fromString: '+refs/heads/*/from:refs/remotes/origin/*/to' forRemote: nil.
	self assert: 'refs/heads/master/from' equals: (fetchSpec remoteBranchOf: 'refs/remotes/origin/master/to').
	self assert: 'refs/heads/mybranch/from' equals: (fetchSpec remoteBranchOf: 'refs/remotes/origin/mybranch/to').