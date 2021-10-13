ui menu
menuCommitListHook: aMenu
	<menuCommitList>
	<menuPriority: 50>
	self selectedCommit ifNil: [^ aMenu].
	aMenu addList: {
		{'Checkout objects'. #actionCommitSelectionCheckout. 'Checkout objects from this commit. You will be able to select what will actually be loaded.', String cr, 'NOTE: unless you change the selection, your uncommitted changes will be reverted, so that what is loaded matches the objects in this commit!'}.
	}.

	^ aMenu