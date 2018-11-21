ui menu
menuBranchListHook: aMenu
	<menuBranchListShifted: false>
	| commands activeBranchName branchStatus onlyActive onlyInactive onlyLocal onlyRemote onlyWithUpstream |
	self hasBranchSelection ifFalse: [^ aMenu].
	activeBranchName := self projectSelection loadedHistorian shortName.
	onlyLocal := selectedHistorian isRemoteTrackingHistorian not.
	onlyRemote := selectedHistorian isRemoteTrackingHistorian.
	onlyActive := selectedHistorian = self projectSelection loadedHistorian.
	onlyInactive := selectedHistorian ~= self projectSelection loadedHistorian.
	onlyWithUpstream := selectedHistorian hasUpstreamHistorian.
	branchStatus := true caseOf:
		{[onlyRemote] -> ['(remote-tracking branch)'].
		[onlyActive] -> ['(currently checked out)']}
		otherwise: ''.
	aMenu addTitle: 'Branch ', selectedHistorian shortName,
		(branchStatus ifNotEmpty: [String cr, branchStatus]).
	commands :=
		{{'Switch to this branch'. #actionBranchSwitch. 'Stash uncommitted changes on the active branch, then checkout the selected branch.'. onlyLocal & onlyInactive}.
		{'Switch, but keep uncommitted changes'. #actionBranchSwitchMoveOver. 'Checkout the selected branch and try to move over uncommitted changes to it.'. onlyLocal & onlyInactive}.
		{'Create a new branch and switch to it'. #actionBranchCreateAndSwitch. 'Create a new branch at the same commit as this branch and switch to the new branch'. onlyRemote}.
		{'Discard uncommitted changes'. #actionBranchResetToTip. nil. onlyActive}.
		{'Merge into ', activeBranchName. #actionBranchMerge. 'Merge this branch into your active branch ', activeBranchName. onlyInactive}.
		'-'.
		{'Push'. #actionBranchPush. nil. onlyLocal}.
		{'Set upstream branch'. #actionSetUpstreamBranch. nil. onlyLocal}.
		{'Remove upstream branch at the remote'. #actionBranchRemoveUpstream. 'Push the deletion of the remote branch'. onlyWithUpstream}.
		'-'.
		{'Rename'. #actionBranchRename. nil. onlyLocal}.
		{'Remove'. #actionBranchRemove}.
		'-'.
		{'Compare with working copy'. #actionBranchDiffWithWorkingCopy}}.
	
	self buildMenu: aMenu from: commands.
	^ aMenu