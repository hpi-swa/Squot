operations
replace: aRebaseOperation with: anotherRebaseOperation
	self operations
		at: (self operations indexOf: aRebaseOperation)
		put: anotherRebaseOperation.
	self operationsChanged.