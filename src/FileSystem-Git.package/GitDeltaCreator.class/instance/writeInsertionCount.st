as yet unclassified
writeInsertionCount
	self output at: self output size - self insertionCount put: self insertionCount.
	self insertionCount: 0.