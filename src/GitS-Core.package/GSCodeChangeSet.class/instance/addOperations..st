adding
addOperations: aCollection
	self changes addAll: (aCollection collect: [:each | GSCodeNormalChange withChangeSet: self operation: each]).