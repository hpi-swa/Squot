as yet unclassified
expandMatchBackwards
	self hasInsertion ifFalse: [^ self].
	[self matchIndex > 1 and: [(self source at: self matchIndex - 1) = (self target at: self targetIndex - 1)]]
		whileTrue: [
			self matchSize: self matchSize + 1.
			self matchIndex: self matchIndex - 1.
			self targetIndex: self targetIndex - 1.
			self erase.
			self insertionCount: self insertionCount - 1.
			self hasInsertion ifFalse: [
				self eraseSlotForInsertionCount.
				^ self]].
	self writeInsertionCount.