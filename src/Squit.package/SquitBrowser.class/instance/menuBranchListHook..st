toolbuilder
menuBranchListHook: aMenu
	<menuBranchList>
	aMenu addList: {
		{'Add branch'. #actionBranchAdd. ''}.
		{'Remove branch'. #actionBranchRemove. ''}}.
	^ aMenu