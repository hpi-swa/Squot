git-operations
updateHeadToCommit: aString
	self unitOfWork
		updateSymbolicRef: self headRefName
		to: aString
		message: (self checkoutReflogMessageTo: aString).