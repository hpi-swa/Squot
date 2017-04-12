toolbuilder
menuBranchListHook: aMenu
	<menuBranchList>
	aMenu addList: {
		{'Checkout branch'. #actionBranchRemove. ''}.
		{'Merge branch'. #actionBranchMerge. ''}.
		{'Push branch'. #actionBranchPush. ''}.
	}.
	aMenu addLine.
	aMenu addList: {
		{'Start tracking a package'. #actionObjectPackageAdd. ''}.
		{'Stop tracking a package'. #actionObjectPackageRemove. ''}.
	}.
	aMenu addLine.
	aMenu addList: {
		{'Add branch'. #actionBranchAdd. ''}.
		{'Rename branch'. #actionBranchRename. ''}.
		{'Remove branch'. #actionBranchRemove. ''}.
	}.
	^ aMenu