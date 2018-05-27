testing
testFindRemoteBranchWithoutWildcardWithWrongTrackingBranch
	| fetchSpec |
	fetchSpec := GitFetchSpec fromString: '+refs/heads/master:refs/remotes/origin/master' forRemote: nil.
	self shouldNotFindRef: [fetchSpec remoteBranchOf: 'refs/remotes/origin/bogus'].
	self shouldNotFindRef: [fetchSpec remoteBranchOf: 'refs/remotes/origin/master/extra'].