private
pushSelectedHistorianByDoing: aBlock
	| historian branchName workingCopy repository gitRepository |
	self hasBranchSelection ifFalse: [^ self].
	selectedHistorian isRemoteTrackingHistorian ifTrue:
		[^ self inform: 'You should not push a remote-tracking branch. Push a local branch instead.'].
	historian := selectedHistorian.
	branchName := historian name.
	workingCopy := self projectSelection.
	repository := workingCopy repository.
	gitRepository := repository fsgitRepository.
	[self withRemoteErrorHandlingDo:
		[self handlingCredentialsOf: historian
			do: 	[aBlock cull: gitRepository]
			ifCanceled: [^ self]]]
	on: GitNonFastForwardPushUpdatesDetected do: [:e |
		(self confirm: 'Warning: the tip of your branch is behind its remote counterpart. Do you want to force the push anyway?')
			ifTrue: [e proceedWithForcedPush]
			ifFalse: [^ self]].