operations
add: aRebaseOperation
	aRebaseOperation rebase: self.
	self activeOperation
		ifNil: [self operations addFirst: aRebaseOperation]
		ifNotNil: [:active | self operations add: aRebaseOperation after: active].
	self operationsChanged.