adding
addOperations: aCollection
	self changes addAll: (aCollection collect: [:each | SquotCodeNormalChange withChangeSet: self operation: each]).