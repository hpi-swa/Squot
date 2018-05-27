testing
testFindRemoteBranchWithWrongTrackingBranch
	| fetchSpec |
	fetchSpec := GitFetchSpec fromString: '+refs/heads/*:refs/remotes/origin/*' forRemote: nil.
	self shouldNotFindRef: [fetchSpec remoteBranchOf: 'refs/remotes/bogus/mybranch'].