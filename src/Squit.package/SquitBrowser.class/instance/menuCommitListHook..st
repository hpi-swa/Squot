ui menu
menuCommitListHook: aMenu
	<menuCommitList>
	| activeBranchName isMenuOnActiveBranch onlyOnInactiveBranch commands |
	activeBranchName := self projectSelection loadedHistorian shortName.
	isMenuOnActiveBranch := selectedHistorian = self projectSelection loadedHistorian.
	onlyOnInactiveBranch := selectedHistorian ~= self projectSelection loadedHistorian.
	commands := 
		{{'Checkout objects'. #actionCommitSelectionCheckout. 'Checkout objects from this commit. You will be able to select what will actually be loaded.', String cr, 'NOTE: unless you change the selection, your uncommitted changes will be reverted, so that what is loaded matches the objects in this commit!'}.
		{'Merge objects'. #actionCommitMergeIntoMemory. 'Merge objects from this commit with the loaded ones. You may use this to pick objects or changes from this commit without discarding your uncommitted changes.'}.
		'-'.
		{'Compare with parent commit'. #actionCommitDiffWithParent}.
		{'Compare with next selected commit'. #actionCommitDiffWithNextSelected. 'The next commit you select will be the origin of a diff against this commit.'}.
		'-'.
		{'Merge into active branch ', activeBranchName. #actionMerge. 'Merge the changes up to this commit into the active branch. Fast-forwards if this is a descendant of the head of the active branch, otherwise creates a merge commit.'. onlyOnInactiveBranch}.
		{'Reset active branch ''', activeBranchName, ''' to this commit'. #actionBranchResetLoadedToCommit. 'Reset the currently active branch to the selected commit'. onlyOnInactiveBranch}.
		{'Reset branch ''', selectedHistorian shortName, ''' to this commit'. #actionBranchResetToCommit}.
		{'Create new branch at this commit'. #actionBranchAdd}.
		{'Tag commit'. #actionCommitTag}.
	}.
	self buildMenu: aMenu from: commands.
	^ aMenu