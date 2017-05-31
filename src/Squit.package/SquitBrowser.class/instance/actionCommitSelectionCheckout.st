actions
actionCommitSelectionCheckout
	self projectSelection loadVersionInteractively: self commitSelection ifCanceled: [^ self].