upstream
upstreamRemoteNameAndRefForBranch: aString
	| remoteName ref |
	remoteName := self unitOfWork upstreamRemoteOfBranchNamed: aString.
	ref := self unitOfWork upstreamRefOfBranchNamed: aString.
	(remoteName isNil or: [ref isNil]) ifTrue: [^ self requestRemoteNameAndRefFor: aString].
	^ remoteName -> ref