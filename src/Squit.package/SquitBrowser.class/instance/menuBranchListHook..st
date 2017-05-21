ui menu
menuBranchListHook: aMenu
	<menuBranchList>
	| activeBranchName |
	self hasBranchSelection ifFalse: [^ aMenu].
	aMenu addList: {
		{'Switch to this branch'. #actionBranchSwitch}
	}.
	activeBranchName := self projectSelection loadedHistorian shortName.
	self branchSelection historian ~= self projectSelection loadedHistorian ifTrue:
		[aMenu addList: {
			{'Merge branch into ', activeBranchName. #actionBranchMerge. 'Merge this branch into your active branch ', activeBranchName}.
		}].
	aMenu addList: {
		{'Push branch'. #actionBranchPush}.
		{'Set upstream branch of this branch'. #actionSetUpstreamBranch}
	}.
	aMenu addLine.
	aMenu addList: {
		{'Rename branch'. #actionBranchRename}.
		{'Remove branch'. #actionBranchRemove}.
	}.
	self branchSelection historian hasUpstreamHistorian ifTrue:
		[aMenu add: 'Remove upstream branch at the remote'
			help: 'Push the deletion of the remote branch'
			action: #actionBranchRemoveUpstream].
	^ aMenu