remotes
chooseRemoteName
	| remoteNames index |
	remoteNames := self unitOfWork remoteNames.
	remoteNames ifEmpty: [self inform: 'No remotes are configured for this project.'. ^ nil].
	index := UIManager default chooseFrom: remoteNames title: 'Remote:'.
	^ remoteNames at: index ifAbsent: [nil]