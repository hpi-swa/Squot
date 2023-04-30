as yet unclassified
findMatch
	self matchSize < 4096 ifFalse: [^ self].
	self hasher addRollingValueAt: self targetIndex.
	self deltaIndex entriesWithHashValue: self hasher hashValue do: [:entry |
		| currentSource sourceRestSize currentTarget newMatchSize |
		currentSource := entry index.
		currentTarget := self targetIndex.
		sourceRestSize := self source size + 1 - currentSource
				clampHigh: self target size + 1 - currentTarget.
		sourceRestSize < self matchSize ifTrue: [^ self].
		[sourceRestSize > 0 and: [(self source at: currentSource) = (self target at: currentTarget)]] whileTrue: [
			sourceRestSize := sourceRestSize - 1.
			currentSource := currentSource + 1.
			currentTarget := currentTarget + 1].
		newMatchSize := currentSource - entry index.
		self matchSize <  newMatchSize ifTrue: [
			self
				matchSize: newMatchSize;
				matchIndex: entry index.
			self matchSize >= 4096 ifTrue: [^ self]]].