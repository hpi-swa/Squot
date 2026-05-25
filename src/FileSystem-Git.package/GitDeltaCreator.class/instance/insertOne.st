accessing
insertOne
	self hasInsertion ifFalse: [self skipSlotForInsertionCount].
	self writeInsertion.
	self targetIndex: self targetIndex + 1.
	self insertionCount = 16r7f ifTrue: [self writeInsertionCount].
	self matchSize: 0.