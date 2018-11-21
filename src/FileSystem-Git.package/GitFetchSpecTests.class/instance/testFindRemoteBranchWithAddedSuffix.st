testing
testFindRemoteBranchWithAddedSuffix
	| fetchSpec |
	fetchSpec := GitFetchSpec fromString: '+refs/heads/*:refs/remotes/origin/*/extra' forRemote: nil.
	self assert: 'refs/heads/master'
		equals: (fetchSpec remoteBranchOf: 'refs/remotes/origin/master/extra').
	self shouldNotFindRef: [fetchSpec remoteBranchOf: 'refs/remotes/origin/master'].