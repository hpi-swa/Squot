actions
actionBranchPush
	| historian branchName repository gitRepository |
	self hasBranchSelection ifFalse: [^ self].
	historian := selectedHistorian.
	branchName := historian name.
	repository := self projectSelection repository.
	gitRepository := repository gitRepository.
	self checkTrackedBranchOrOfferChange: historian ifUnsupported: [^ self].
	[self handlingCredentialsOf: historian
		do: 	[self projectSelection repository
			exportToUpstream: historian
			ifNone: [
				self offerToSetUpstreamBranchOf: branchName
					in: gitRepository
					ifCanceled: [^ self].
				^ self actionBranchPush "try again"]]
		ifCanceled: [^ self]]
	on: GitNonFastForwardPushUpdatesDetected do: [:e |
		(self confirm: 'Warning: the tip of your branch is behind its remote counterpart. Do you want to force the push anyway?')
			ifTrue: [e proceedWithForcedPush]
			ifFalse: [^ self]].