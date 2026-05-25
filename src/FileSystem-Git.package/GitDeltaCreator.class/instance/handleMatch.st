as yet unclassified
handleMatch
	self matchSize < 4
		ifTrue: [self insertOne]
		ifFalse: [self
					expandMatchBackwards;
					writeCopy;
					reinitializeHashValue].