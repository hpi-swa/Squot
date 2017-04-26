git porcelain
pushToUpstreamBranchOf: localBranchName ifNone: noUpstreamBranchBlock
	| remoteName branchName remoteRef remoteUrl |
	branchName := localBranchName.
	(localBranchName beginsWith: 'refs/heads/')
		ifTrue: [branchName := branchName allButFirst: 'refs/heads/' size].
	remoteName := repository upstreamRemoteOfBranchNamed: branchName.
	remoteName ifNil: [^ noUpstreamBranchBlock value].
	remoteUrl := repository remoteConfigFor: remoteName option: 'url'.
	remoteUrl ifNil: [^ noUpstreamBranchBlock value].
	remoteRef := repository upstreamRefOfBranchNamed: branchName.
	remoteRef ifNil: [remoteRef := branchName].
	^ self push: {branchName -> remoteRef} toRemote: remoteName