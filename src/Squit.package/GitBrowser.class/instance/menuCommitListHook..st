toolbuilder
menuCommitListHook: aMenu
	<menuCommitList>
	aMenu addList: {
		{'Checkout'. #actionCommitSelectionCheckout. 'Checkout this commit.'}
	}.
	^ aMenu