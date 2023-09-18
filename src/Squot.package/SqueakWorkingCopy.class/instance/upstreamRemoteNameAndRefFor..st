upstream
upstreamRemoteNameAndRefFor: aString
	(self isSqueakBranchRef: aString) ifTrue: [^ self upstreamRemoteNameAndRefForBranch: aString].
	^ self requestRemoteNameAndRefFor: aString