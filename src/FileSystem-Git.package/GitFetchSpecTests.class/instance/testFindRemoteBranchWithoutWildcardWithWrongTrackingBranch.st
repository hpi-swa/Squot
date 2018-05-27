testing
testFindRemoteBranchWithoutWildcardWithWrongTrackingBranch
	| fetchSpec badInvocation error |
	fetchSpec := GitFetchSpec fromString: '+refs/heads/master:refs/remotes/origin/master' forRemote: nil.
	badInvocation := [fetchSpec remoteBranchOf: 'refs/remotes/origin/bogus'].
	error := self exception: Error raisedBy: badInvocation.
	self shouldNotBeATypeError: error.
	badInvocation := [fetchSpec remoteBranchOf: 'refs/remotes/origin/master/extra'].
	error := self exception: Error raisedBy: badInvocation.
	self shouldNotBeATypeError: error.