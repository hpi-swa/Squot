adding
addConflicts: aCollection
	self changes addAll: (aCollection collect: [:each | SquotTonelConflictChange withChangeSet: self conflict: each]).