operations
addAll: aCollection
	aCollection do: [:each | each rebase: self].
	self operations addAll: aCollection.
	self operationsChanged.