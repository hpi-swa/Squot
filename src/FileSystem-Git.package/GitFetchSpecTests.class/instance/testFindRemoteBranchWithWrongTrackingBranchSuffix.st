testing
testFindRemoteBranchWithWrongTrackingBranchSuffix
	| fetchSpec badInvocation error |
	fetchSpec := GitFetchSpec fromString: '+refs/heads/*/from:refs/remotes/origin/*/to' forRemote: nil.
	badInvocation := [fetchSpec remoteBranchOf: 'refs/remotes/origin/mybranch/bogus'].
	error := self exception: Error raisedBy: badInvocation.
	self shouldNotBeATypeError: error.