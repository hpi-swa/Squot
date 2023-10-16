adding
addOperations: aCollection
	self changes addAll: (aCollection collect: [:each | SquotCodeOperationChange withChangeSet: self operation: each]).