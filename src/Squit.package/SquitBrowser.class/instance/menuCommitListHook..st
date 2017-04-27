ui menu
menuCommitListHook: aMenu
	<menuCommitList>
	| activeBranchName |
	aMenu addList: {
		{'Checkout commit'. #actionCommitSelectionCheckout. 'Checkout this commit.'}
	}.
	activeBranchName := self projectSelection loadedHistorian shortName.
	self branchSelection historian ~= self projectSelection loadedHistorian ifTrue:
		[aMenu add: 'Reset active branch ', activeBranchName, ' to this commit'
			help: 'Reset the currently active branch to the selected commit'
			action: #actionBranchResetLoadedToCommit].
	aMenu addList: {
		{'Reset branch ', self branchSelection historian name, ' to this commit'. #actionBranchResetToCommit. ''}.
	}.
	self branchSelection historian ~= self projectSelection loadedHistorian ifTrue:
		[aMenu add: 'Merge this into active branch ', activeBranchName
			help: 'Merge the changes up to this commit into the active branch. Fast-forwards if this is a descendant of the head of the active branch, otherwise creates a merge commit.'
			action: #actionMerge].
	aMenu addList: {
		{'Create new branch at this commit'. #actionBranchAdd. ''}.
		{'Tag commit'. #actionCommitTag. ''}.
	}.
	^ aMenu