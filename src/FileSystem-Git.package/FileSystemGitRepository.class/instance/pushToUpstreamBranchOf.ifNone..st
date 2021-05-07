git porcelain
pushToUpstreamBranchOf: localBranchName ifNone: noUpstreamBranchBlock
	| remoteName branchName remoteRef remoteUrl |
	branchName := localBranchName.
	(localBranchName beginsWith: 'refs/heads/')
		ifTrue: [branchName := branchName allButFirst: 'refs/heads/' size].
	remoteName := self unitOfWork upstreamRemoteOfBranchNamed: branchName.
	remoteName ifNil: [^ noUpstreamBranchBlock value].
	remoteUrl := self unitOfWork remoteConfigFor: remoteName option: 'url'.
	remoteUrl ifNil: [^ noUpstreamBranchBlock value].
	remoteRef := self unitOfWork upstreamRefOfBranchNamed: branchName.
	remoteRef ifNil: [remoteRef := branchName].
	^ self push: {branchName -> remoteRef} toRemote: remoteName