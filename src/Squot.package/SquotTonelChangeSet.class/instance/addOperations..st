adding
addOperations: aCollection
	self changes addAll: (aCollection collect: [:each | SquotTonelOperationChange withChangeSet: self operation: each]).