testing
testFindRemoteBranchWithRemovedSuffix
	| fetchSpec |
	fetchSpec := GitFetchSpec fromString: '+refs/heads/*/extra:refs/remotes/origin/*' forRemote: nil.
	self assert: 'refs/heads/master/extra'
		equals: (fetchSpec remoteBranchOf: 'refs/remotes/origin/master').