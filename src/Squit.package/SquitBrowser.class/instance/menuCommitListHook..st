ui menu
menuCommitListHook: aMenu
	<menuCommitList>
	aMenu addList: {
		{'Checkout commit'. #actionCommitSelectionCheckout. 'Checkout this commit.'}
	}.
	self branchSelection historian ~= self projectSelection loadedHistorian ifTrue:
		[aMenu add: 'Reset active branch ', self projectSelection loadedHistorian shortName, ' to this commit'
			help: 'Reset the currently active branch to the selected commit'
			action: #actionBranchResetLoadedToCommit].
	aMenu addList: {
		{'Reset branch ', self branchSelection historian name, ' to this commit'. #actionBranchResetToCommit. ''}.
		{'Create new branch at this commit'. #actionBranchAdd. ''}.
		{'Tag commit'. #actionCommitTag. ''}.
	}.
	^ aMenu