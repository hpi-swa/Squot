as yet unclassified
writeInsertionsWhileInitializingHashValue
	self skipSlotForInsertionCount.
	self hasher class window timesRepeat: [
		self isAtEnd ifTrue: [^ self].
		self writeInsertion.
		self hasher addFirstWindowValueAt: self targetIndex.
		self targetIndex: self targetIndex + 1].