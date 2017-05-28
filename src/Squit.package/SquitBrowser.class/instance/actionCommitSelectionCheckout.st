actions
actionCommitSelectionCheckout
	self break.
	self projectSelection loadVersionInteractively: self commitSelection ifCanceled: [^ self].