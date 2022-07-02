actions on branches
push: aHistorian toRemoteNamed: aString
	self flag: #remoteRepository.
	[(SquitInteractivePush
		historian: aHistorian
		remote: (aHistorian repository git remoteNamed: aString)
		remoteBranchName: (SquotGUI
								request: 'Branch name at remote:'
								initialAnswer: selectedHistorian shortName))
		push.
	Project current addDeferredUIMessage: [self loadCommitList "the remote-tracking branch changes"]]
		on: SquitBadRemote do:
			[:e |
			Project current addDeferredUIMessage: [self showBadRemote: e remote].
			e resume]
		on: SquitIllegalUseOfRemoteTrackingBranch do:
			[self inform: 'You should not push a remote-tracking branch. Push a local branch instead.']
		on: SquotCannotExportEmptyHistory do:
			[self inform: 'No commits to push on ', aHistorian shortName, ' yet.'].