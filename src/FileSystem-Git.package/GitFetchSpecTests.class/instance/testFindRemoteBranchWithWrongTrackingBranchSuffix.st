testing
testFindRemoteBranchWithWrongTrackingBranchSuffix
	| fetchSpec |
	fetchSpec := GitFetchSpec fromString: '+refs/heads/*/from:refs/remotes/origin/*/to' forRemote: nil.
	self shouldNotFindRef: [fetchSpec remoteBranchOf: 'refs/remotes/origin/mybranch/bogus'].