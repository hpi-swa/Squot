actions
actionCommitSelectionCheckout
	
	self withUnitOfWork:
		[self selectedRepository loadVersionInteractively: self selectedCommit ifCanceled: [^ self]].