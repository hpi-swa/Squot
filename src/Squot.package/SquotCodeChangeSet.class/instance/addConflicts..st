adding
addConflicts: aCollection
	self changes addAll: (aCollection collect: [:each | SquotCodeConflictChange withChangeSet: self conflict: each]).