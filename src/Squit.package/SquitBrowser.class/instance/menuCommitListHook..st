toolbuilder
menuCommitListHook: aMenu
	<menuCommitList>
	aMenu addList: {
		{'Checkout commit'. #actionCommitSelectionCheckout. 'Checkout this commit.'}.
		{'Reset branch to commit'. #actionBranchResetToCommit. ''}.
		{'Tag commit'. #actionCommitTag. ''}.
	}.
	^ aMenu