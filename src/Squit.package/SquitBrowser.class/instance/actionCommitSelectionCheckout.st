actions
actionCommitSelectionCheckout
	self withUnitOfWork:
	[self projectSelection loadVersionInteractively: self commitSelection ifCanceled: [^ self]].