testing
testFindRemoteBranch
	| fetchSpec |
	fetchSpec := GitFetchSpec fromString: '+refs/heads/*:refs/remotes/origin/*' forRemote: nil.
	self assert: 'refs/heads/master' equals: (fetchSpec remoteBranchOf: 'refs/remotes/origin/master').
	self assert: 'refs/heads/mybranch' equals: (fetchSpec remoteBranchOf: 'refs/remotes/origin/mybranch').