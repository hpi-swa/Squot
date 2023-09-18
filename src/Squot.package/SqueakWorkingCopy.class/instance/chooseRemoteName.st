remotes
chooseRemoteName
	| remoteNames index |
	remoteNames := self unitOfWork remoteNames.
	index := UIManager default chooseFrom: remoteNames title: 'Remote:'.
	^ remoteNames at: index ifAbsent: [nil]