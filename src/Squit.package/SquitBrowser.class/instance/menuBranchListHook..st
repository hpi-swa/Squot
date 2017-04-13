toolbuilder
menuBranchListHook: aMenu
	<menuBranchList>
	aMenu addList: {
		{'Switch to this branch'. #actionBranchSwitch. ''}.
		{'Merge branch'. #actionBranchMerge. ''}.
		{'Push branch'. #actionBranchPush. ''}.
	}.
	aMenu addLine.
	aMenu addList: {
		{'Start tracking packages'. #actionObjectPackageAdd. ''}.
		{'Stop tracking packages'. #actionObjectPackageRemove. ''}.
	}.
	aMenu addLine.
	aMenu addList: {
		{'Rename branch'. #actionBranchRename. ''}.
		{'Remove branch'. #actionBranchRemove. ''}.
	}.
	^ aMenu