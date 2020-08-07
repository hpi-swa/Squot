actions on branches
pushBranch
	| historian |
	self hasBranchSelection ifFalse: [^ self].
	historian := selectedHistorian.
	[[(SquitInteractivePushToUpstream historian: historian) push]
		on: SquitUpstreamUndefined do:
			[:e |
			self inform: e historian shortName, ' has no upstream branch. Please set one, then push again.'.
			Project current addDeferredUIMessage: [self actionSetUpstreamBranch]]
		on: SquitBadRemote do:
			[:e |
			Project current addDeferredUIMessage:
				[self actionManageRemotes
					selectedRemoteName: e remote name].
			e resume]]
		on: SquitIllegalUseOfRemoteTrackingBranch do:
			[self inform: 'You should not push a remote-tracking branch. Push a local branch instead.']
		on: SquotCannotExportEmptyHistory do:
			[self inform: 'No commits to push on ', historian shortName, ' yet.'].