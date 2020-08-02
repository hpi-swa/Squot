actions on branches
pushBranch
	| historian |
	self hasBranchSelection ifFalse: [^ self].
	historian := selectedHistorian.
	[self withRemoteErrorHandlingDo:
		[self handlingCredentialsOf: historian repository
			do:
				[[historian exportToUpstream]
					on: GitNonFastForwardPushUpdatesDetected do:
						[:ex | (self confirm: 'Warning: the tip of your branch is behind its remote counterpart. Do you want to force the push anyway?')
							ifTrue: [ex proceedWithForcedPush]
							ifFalse: [ex return]]
					on: SquitUpstreamUndefined do:
						[:e |
						self inform: e historian shortName, ' has no upstream branch. Please set one, then push again.'.
						Project current addDeferredUIMessage: [self actionSetUpstreamBranch]]]
			ifCanceled: 	[^ self]]]
		on: SquitBadRemote do:
			[:e |
			Project current addDeferredUIMessage: [self actionManageRemotes].
			e resume]
		on: SquitIllegalUseOfRemoteTrackingBranch do:
			[self inform: 'You should not push a remote-tracking branch. Push a local branch instead.']
		on: SquotCannotExportEmptyHistory do:
			[self inform: 'No commits to push on ', historian shortName, ' yet.'].