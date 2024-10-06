events
dropItem: aRebaseOperation on: anotherRebaseOperation
	aRebaseOperation == anotherRebaseOperation ifTrue: [^ self].
	self operations remove: aRebaseOperation ifAbsent: [].
	anotherRebaseOperation isHeader
		ifTrue: [self operations addFirst: aRebaseOperation]
		ifFalse: [self operations add: aRebaseOperation after: anotherRebaseOperation].
	self operationsChanged.