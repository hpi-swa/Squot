ui menu
menuBranchListHook: aMenu
	<menuBranchList>
	aMenu addList: {
		{'Switch to this branch'. #actionBranchSwitch}.
		{'Merge branch'. #actionBranchMerge. 'Merge another branch into your current one.'}.
		{'Push branch'. #actionBranchPush}.
	}.
	aMenu addLine.
	aMenu addList: {
		{'Start tracking packages'. #actionObjectPackageAdd. 'Add new packages to this project.'}.
		{'Stop tracking packages'. #actionObjectPackageRemove. 'Remove packages from this project.'}.
	}.
	aMenu addLine.
	aMenu addList: {
		{'Rename branch'. #actionBranchRename}.
		{'Remove branch'. #actionBranchRemove}.
	}.
	^ aMenu