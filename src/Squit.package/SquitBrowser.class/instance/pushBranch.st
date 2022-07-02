actions on branches
pushBranch
	| historian |
	self hasBranchSelection ifFalse: [^ self].
	historian := selectedHistorian.
	[[(SquitInteractivePushToUpstream historian: historian) push.
	self changed: #commitList "update the decorations, the remote-tracking branch changes"]
		on: SquitUpstreamUndefined do:
			[:e |
			self inform: e historian shortName, ' has no upstream branch. Please set one first. Afterwards your branch will be pushed immediately.'.
			(self setUpstreamBranchOf: historian) ifNotNil: [e retry]]
		on: SquitBadRemote do:
			[:e |
			Project current addDeferredUIMessage: [self showBadRemote: e remote].
			e resume]]
		on: SquitIllegalUseOfRemoteTrackingBranch do:
			[self inform: 'You should not push a remote-tracking branch. Push a local branch instead.']
		on: SquotCannotExportEmptyHistory do:
			[self inform: 'No commits to push on ', historian shortName, ' yet.'].