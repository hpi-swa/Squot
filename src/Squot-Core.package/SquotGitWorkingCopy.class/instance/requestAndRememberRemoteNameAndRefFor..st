upstream
requestAndRememberRemoteNameAndRefFor: aString
	| remoteNameAndRef |
	remoteNameAndRef := self requestRemoteNameAndRefFor: aString.
	(UIManager default confirm: 'Remember the remote branch for this branch?')
		ifTrue: [self setUpstreamRemoteNameAndRef: remoteNameAndRef for: aString].
	^ remoteNameAndRef