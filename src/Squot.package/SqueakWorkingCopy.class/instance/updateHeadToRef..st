git-operations
updateHeadToRef: aString
	self unitOfWork
		updateSymbolicRef: self headRefName
		toRef: aString
		message: (self checkoutReflogMessageTo: aString).