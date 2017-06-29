ui menu
menuBranchListHook: aMenu
	<menuBranchList>
	| commands activeBranchName onlyActive onlyInactive onlyLocal onlyRemote onlyWithUpstream |
	self hasBranchSelection ifFalse: [^ aMenu].
	activeBranchName := self projectSelection loadedHistorian shortName.
	onlyLocal := selectedHistorian isRemoteTrackingHistorian not.
	onlyRemote := selectedHistorian isRemoteTrackingHistorian.
	onlyActive := selectedHistorian = self projectSelection loadedHistorian.
	onlyInactive := selectedHistorian ~= self projectSelection loadedHistorian.
	onlyWithUpstream := selectedHistorian hasUpstreamHistorian.
	commands :=
		{{'Switch to this branch'. #actionBranchSwitch. 'Stash uncommitted changes on the active branch, then checkout the selected branch.'. {onlyLocal. onlyInactive}}.
		{'Switch, keeping uncommitted changes'. #actionBranchSwitchMoveOver. 'Checkout the selected branch and try to move over uncommitted changes to it.'. {onlyLocal. onlyInactive}}.
		{'Create a new branch and switch to it'. #actionBranchCreateAndSwitch. 'Create a new branch at the same commit as this branch and switch to the new branch'. {onlyRemote}}.
		{'Discard uncommitted changes'. #actionBranchResetToTip. nil. {onlyActive}}.
		{'Merge branch into ', activeBranchName. #actionBranchMerge. 'Merge this branch into your active branch ', activeBranchName. {onlyInactive}}.
		'-'.
		{'Push branch'. #actionBranchPush. nil. {onlyLocal}}.
		{'Set upstream branch of this branch'. #actionSetUpstreamBranch. nil. {onlyLocal}}.
		{'Remove upstream branch at the remote'. #actionBranchRemoveUpstream. 'Push the deletion of the remote branch'. {onlyWithUpstream}}.
		'-'.
		{'Rename branch'. #actionBranchRename. nil. {onlyLocal}}.
		{'Remove branch'. #actionBranchRemove}}.
	
	commands do: [:each |
		each = '-'
			ifTrue: [aMenu addLine]
			ifFalse: [((each at: 4 ifAbsent: [#()]) allSatisfy: [:all | all == true])
					ifTrue: [aMenu addList: {each first: (3 min: each size)}]]].
	^ aMenu