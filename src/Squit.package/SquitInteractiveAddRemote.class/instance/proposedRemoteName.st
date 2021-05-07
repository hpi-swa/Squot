running
proposedRemoteName
	| suggestion isFirstRemote isGitHubUrl |
	isFirstRemote := self repository remoteNames isEmpty.
	isFirstRemote
		ifTrue: [suggestion := 'origin']
		ifFalse:
			[isGitHubUrl := query remoteUrl includesSubstring: '://github.com/'.
			isGitHubUrl ifTrue:
				[ | repoOwner | repoOwner := (query remoteUrl splitBy: '/') at: 4 ifAbsent: [].
				suggestion := repoOwner]].
	(self repository remoteNames includes: suggestion) ifTrue: [suggestion := nil].
	^ suggestion ifNil: ['']