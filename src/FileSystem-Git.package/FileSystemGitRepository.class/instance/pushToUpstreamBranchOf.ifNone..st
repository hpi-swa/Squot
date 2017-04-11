git porcelain
pushToUpstreamBranchOf: localBranchName ifNone: noUpstreamBranchBlock
	| remoteName branchName |
	branchName := localBranchName.
	(localBranchName beginsWith: 'refs/heads/')
		ifTrue: [branchName := branchName allButFirst: 'refs/heads/' size].
	remoteName := repository configAt: 'branch.', branchName, '.remote'.
	remoteName ifNil: [^ noUpstreamBranchBlock value].
	^ self push: {branchName} toRemote: remoteName