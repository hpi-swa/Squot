toolbuilder
menuCommitListHook: aMenu
	<menuCommitList>
	aMenu addList: {
		{'Checkout commit'. #actionCommitSelectionCheckout. 'Checkout this commit.'}.
		{'Reset branch to commit'. #actionBranchResetToCommit. ''}.
		{'Create new branch at this commit'. #actionBranchAdd. ''}.
		{'Tag commit'. #actionCommitTag. ''}.
	}.
	^ aMenu