testing
testFindRemoteBranchWithWrongTrackingBranch
	| fetchSpec badInvocation error |
	fetchSpec := GitFetchSpec fromString: '+refs/heads/*:refs/remotes/origin/*' forRemote: nil.
	badInvocation := [fetchSpec remoteBranchOf: 'refs/remotes/bogus/mybranch'].
	error := self exception: Error raisedBy: badInvocation.
	self shouldNotBeATypeError: error.
	