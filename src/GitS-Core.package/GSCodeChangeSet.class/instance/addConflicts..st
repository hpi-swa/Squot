adding
addConflicts: aCollection
	self changes addAll: (aCollection collect: [:each | GSCodeConflictChange withChangeSet: self conflict: each]).