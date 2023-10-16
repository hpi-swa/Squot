remotes
chooseRemoteName
	| remoteNames index |
	[remoteNames := self unitOfWork remoteNames.
	remoteNames isEmpty] whileTrue: [
		(self confirm: 'No remotes are configured for this project. Do you want to add one now?')
			ifFalse: [^ nil].
		self actionAddRemote].
	index := UIManager default chooseFrom: remoteNames title: 'Remote:'.
	^ remoteNames at: index ifAbsent: [nil]