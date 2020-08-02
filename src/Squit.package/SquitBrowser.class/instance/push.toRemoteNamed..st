actions on branches
push: aHistorian toRemoteNamed: aString
	[(SquitInteractivePush
		historian: aHistorian
		remote: (aHistorian repository git remoteNamed: aString)
		remoteBranchName: (SquotGUI
								request: 'Branch name at remote:'
								initialAnswer: selectedHistorian shortName))
		push]
		on: SquitBadRemote do:
			[:e |
			Project current addDeferredUIMessage: [self actionManageRemotes].
			e resume]
		on: SquitIllegalUseOfRemoteTrackingBranch do:
			[self inform: 'You should not push a remote-tracking branch. Push a local branch instead.']
		on: SquotCannotExportEmptyHistory do:
			[self inform: 'No commits to push on ', aHistorian shortName, ' yet.'].