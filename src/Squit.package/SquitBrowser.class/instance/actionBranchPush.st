actions on branches
actionBranchPush
	| historian branchName workingCopy repository gitRepository |
	self hasBranchSelection ifFalse: [^ self].
	selectedHistorian isRemoteTrackingHistorian ifTrue:
		[^ self inform: 'You should not push a remote-tracking branch. Push a local branch instead.'].
	historian := selectedHistorian.
	branchName := historian name.
	workingCopy := self projectSelection.
	repository := workingCopy repository.
	gitRepository := repository gitRepository.
	self checkTrackedBranchOrOfferChange: historian ifUnsupported: [^ self].
	[self withRemoteErrorHandlingDo:
		[self handlingCredentialsOf: historian
			do: 	[workingCopy repository
				exportToUpstream: historian
				ifNone: [
					self offerToSetUpstreamBranchOf: historian shortName
						in: gitRepository
						ifCanceled: [^ self].
					^ self actionBranchPush "try again"]]
			ifCanceled: [^ self]]]
	on: GitNonFastForwardPushUpdatesDetected do: [:e |
		(self confirm: 'Warning: the tip of your branch is behind its remote counterpart. Do you want to force the push anyway?')
			ifTrue: [e proceedWithForcedPush]
			ifFalse: [^ self]].