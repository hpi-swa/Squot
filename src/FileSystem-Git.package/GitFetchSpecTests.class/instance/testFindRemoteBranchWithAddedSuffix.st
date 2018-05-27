testing
testFindRemoteBranchWithAddedSuffix
	| fetchSpec badInvocation error |
	fetchSpec := GitFetchSpec fromString: '+refs/heads/*:refs/remotes/origin/*/extra' forRemote: nil.
	self assert: 'refs/heads/master'
		equals: (fetchSpec remoteBranchOf: 'refs/remotes/origin/master/extra').
	badInvocation := [fetchSpec remoteBranchOf: 'refs/remotes/origin/master'].
	error := self exception: Error raisedBy: badInvocation.
	self shouldNotBeATypeError: error.