actions on branches
pushBranch
	| historian newUpstream |
	self hasBranchSelection ifFalse: [^ self].
	historian := selectedHistorian.
	[self withRemoteErrorHandlingDo:
		[[self handlingCredentialsOf: historian repository
			do:
				[[historian exportToUpstream]
					on: SquitUpstreamUndefined do:
						[:ex |
						(newUpstream := self offerToSetUpstreamBranchOf: selectedHistorian)
							ifNotNil: [ex retry]
							ifNil: [ex return]]
					on: GitNonFastForwardPushUpdatesDetected do:
						[:ex | (self confirm: 'Warning: the tip of your branch is behind its remote counterpart. Do you want to force the push anyway?')
							ifTrue: [ex proceedWithForcedPush]
							ifFalse: [ex return]]]
			ifCanceled:
				[newUpstream ifNotNil: [historian untrackUpstream].
				^ self]]

			on: GitRemoteResourceNotFound do: "prompt, on OK retry setting new upstream"
				[:error | | answer |
				answer := self errorRemoteResourceNotFound: error.
				newUpstream ifNotNil: [historian untrackUpstream].
				(answer notNil "OK" and: [newUpstream notNil]) ifTrue:
					[error retry "Prompt again to add another remote"]]
			on: GitRemoteAuthenticationFailed 	do: "already cancelled credentials prompt"
				[:error | newUpstream ifNotNil: [historian untrackUpstream]]]]
		on: SquitIllegalUseOfRemoteTrackingBranch do:
			[self inform: 'You should not push a remote-tracking branch. Push a local branch instead.']
		on: SquotCannotExportEmptyHistory do:
			[self inform: 'No commits to push on ', historian shortName, ' yet.'].