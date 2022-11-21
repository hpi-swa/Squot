ui menu
menuBranchListHook: aMenu
	<menuBranchListShifted: false>
	| activeBranchName branchStatus onlyActive onlyInactive onlyLocal onlyRemote onlyWithUpstream hasRemotes |
	self hasBranchSelection ifFalse: [^ aMenu].
	self withUnitOfWork:
	[activeBranchName := self projectSelection loadedHistorian shortName.
	onlyLocal := selectedHistorian isRemoteTrackingHistorian not.
	onlyRemote := selectedHistorian isRemoteTrackingHistorian.
	onlyActive := selectedHistorian = self projectSelection loadedHistorian.
	onlyInactive := selectedHistorian ~= self projectSelection loadedHistorian.
	onlyWithUpstream := selectedHistorian hasUpstreamHistorian.
	hasRemotes := self projectSelection repository hasRemotes.
	branchStatus := true caseOf:
		{[onlyRemote] -> ['(remote-tracking branch)'].
		[onlyActive] -> ['(currently checked out)']}
		otherwise: ''.
	aMenu addTitle: 'Branch ', selectedHistorian shortName,
		(branchStatus ifNotEmpty: [String cr, branchStatus]).
	self buildMenu: aMenu from:
		{{'Switch to this branch'. #actionBranchSwitch. 'Stash uncommitted changes on the active branch, then checkout the selected branch.'. onlyLocal & onlyInactive}.
		{'Switch, but keep uncommitted changes'. #actionBranchSwitchMoveOver. 'Checkout the selected branch and try to move over uncommitted changes to it.'. onlyLocal & onlyInactive}.
		{'Create a new branch and switch to it'. #actionBranchCreateAndSwitch. 'Create a new branch at the same commit as this branch and switch to the new branch'. onlyRemote}.
		{'Discard uncommitted changes'. #actionBranchResetToTip. 'Replace any changes in your working copy with the state of the tip of the active branch.'. onlyActive}.
		{'Merge into ', activeBranchName. #actionBranchMerge. 'Merge this branch into your active branch ', activeBranchName. onlyInactive}.
		'-'.
		{'Push'. #actionBranchPush. 'Push this branch to its upstream remote'. onlyLocal}}.
	(onlyLocal and: [hasRemotes]) ifTrue:
		[aMenu add: 'Push to' subMenu: self remotesPushSubMenu].
	self buildMenu: aMenu from:
		{{'Set upstream branch'. #actionSetUpstreamBranch. 'Configure the upstream remote of this branch.'. onlyLocal}.
		{'Remove upstream branch at the remote'. #actionBranchRemoveUpstream. 'Push the deletion of the remote branch'. onlyWithUpstream}.
		'-'.
		{'Rename'. #actionBranchRename. 'Rename this branch'. onlyLocal}.
		{'Remove'. #actionBranchRemove}.
		'-'.
		{'Compare with working copy'. #actionBranchDiffWithWorkingCopy}}].

	^ aMenu