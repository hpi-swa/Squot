as yet unclassified
swaMenuCommitListHook: aMenu
	<swaMenuCommitList>
	| activeBranchName isMenuOnActiveBranch onlyOnInactiveBranch commands |
	self hasProjectSelection ifFalse: [^ aMenu].
	aMenu addTitle: (self commitSelection printStringLimitedTo: 50).
	self withUnitOfWork:
	[activeBranchName := self projectSelection loadedHistorian shortName.
	isMenuOnActiveBranch := selectedHistorian = self projectSelection loadedHistorian.
	onlyOnInactiveBranch := selectedHistorian ~= self projectSelection loadedHistorian.
	commands := {
		{'Checkout objects'. #actionCommitSelectionCheckout. 'Checkout objects from this commit. You will be able to select what will actually be loaded.', String cr, 'NOTE: unless you change the selection, your uncommitted changes will be reverted, so that what is loaded matches the objects in this commit!'}.
		{'Merge objects'. #actionCommitMergeIntoMemory. 'Merge objects from this commit with the loaded ones. You may use this to pick objects or changes from this commit without discarding your uncommitted changes.'}.
		'-'.
		{'Compare with parent commit'. #actionCommitDiffWithParent}.
		{'Compare with next selected commit'. #actionCommitDiffWithNextSelected. 'The next commit you select will be the origin of a diff against this commit.'}.
		{'Compare with working copy'. #actionCommitDiffWithWorkingCopy}.
	}.
	self buildMenu: aMenu from: commands].
	^ aMenu