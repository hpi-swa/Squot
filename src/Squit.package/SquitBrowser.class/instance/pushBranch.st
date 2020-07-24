actions on branches
pushBranch
	| historian newUpstream newRemote |
	self hasBranchSelection ifFalse: [^ self].
	historian := selectedHistorian.
	[self withRemoteErrorHandlingDo:
		[[self handlingCredentialsOf: historian repository
			do:
				[[historian exportToUpstream]
					on: GitNonFastForwardPushUpdatesDetected do:
						[:ex | (self confirm: 'Warning: the tip of your branch is behind its remote counterpart. Do you want to force the push anyway?')
							ifTrue: [ex proceedWithForcedPush]
							ifFalse: [ex return]]
					on: SquitUpstreamUndefined do:
						[:ex |
						[(newUpstream := self offerToSetUpstreamBranchOf: selectedHistorian)
							ifNotNil: [ex retry]
							ifNil: [ex return]]
							on: SquitNoRemotes do:
								[:noRemotes |
								newRemote := self offerToAddRemoteTo: historian repository.
								newRemote ifNil: [noRemotes return] ifNotNil: [noRemotes resume: newRemote]]]]
			ifCanceled:
				[newUpstream ifNotNil: [historian untrackUpstream].
				newRemote ifNotNil: [historian git removeRemoteNamed: newRemote].
				^ self]]

			on: GitRemoteResourceNotFound do: "prompt, on OK retry setting new upstream"
				[:error | | answer |
				answer := self errorRemoteResourceNotFound: error.
				newUpstream ifNotNil: [historian untrackUpstream].
				newRemote ifNotNil: [historian git removeRemoteNamed: newRemote].
				(answer notNil "OK" and: [newUpstream notNil]) ifTrue:
					[error retry "Prompt again to add another remote"]]
			on: GitRemoteAuthenticationFailed 	do: "already cancelled credentials prompt"
				[:error |
				newUpstream ifNotNil: [historian untrackUpstream].
				newRemote ifNotNil: [historian git removeRemoteNamed: newRemote]]]]
		on: SquitIllegalUseOfRemoteTrackingBranch do:
			[self inform: 'You should not push a remote-tracking branch. Push a local branch instead.']
		on: SquotCannotExportEmptyHistory do:
			[self inform: 'No commits to push on ', historian shortName, ' yet.'].