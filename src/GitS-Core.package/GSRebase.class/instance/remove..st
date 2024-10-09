operations
remove: aRebaseOperation
	aRebaseOperation = self nextOperation ifTrue: [self continueBlock: nil].
	self operations remove: aRebaseOperation.
	self operationsChanged.