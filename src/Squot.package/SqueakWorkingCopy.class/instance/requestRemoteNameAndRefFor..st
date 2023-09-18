upstream
requestRemoteNameAndRefFor: aString
	| remoteName ref |
	remoteName := self chooseRemoteName.
	remoteName ifNil: [^ nil].
	ref := UIManager default
			request: 'Remote ref name:'
			initialAnswer: (self initialRemoteRefNameFor: aString).
	ref isEmptyOrNil ifTrue: [^ nil].
	ref := self fsgitRepository expandRemoteRef: ref.
	(UIManager default confirm: 'Remember the remote branch for this branch?')
		ifTrue: [self setUpstreamRemoteName: remoteName andRef: ref for: aString].
	^ remoteName -> ref