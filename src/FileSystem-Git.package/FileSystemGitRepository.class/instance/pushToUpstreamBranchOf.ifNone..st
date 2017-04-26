git porcelain
pushToUpstreamBranchOf: localBranchName ifNone: noUpstreamBranchBlock
	| remoteName branchName |
	branchName := localBranchName.
	(localBranchName beginsWith: 'refs/heads/')
		ifTrue: [branchName := branchName allButFirst: 'refs/heads/' size].
	remoteName := repository upstreamRemoteOfBranchNamed: branchName.
	remoteName ifNil: [^ noUpstreamBranchBlock value].
	^ self push: {branchName} toRemote: remoteName