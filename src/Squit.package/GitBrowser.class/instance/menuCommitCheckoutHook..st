toolbuilder
menuCommitCheckoutHook: aMenu
	<menuCommitCheckout>
	aMenu addList: {
		{'Checkout'. #actionCommitSelectionCheckout. 'Checkout this commit.'}
	}.
	^ aMenu