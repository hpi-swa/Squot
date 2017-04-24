ui menu
menuBranchListHook: aMenu
	<menuBranchList>
	aMenu addList: {
		{'Switch to this branch'. #actionBranchSwitch}.
		"{'Merge branch'. #actionBranchMerge. 'Merge another branch into your current one.'}."
		{'Push branch'. #actionBranchPush}.
	}.
	aMenu addLine.
	aMenu addList: {
		{'Rename branch'. #actionBranchRename}.
		{'Remove branch'. #actionBranchRemove}.
	}.
	^ aMenu