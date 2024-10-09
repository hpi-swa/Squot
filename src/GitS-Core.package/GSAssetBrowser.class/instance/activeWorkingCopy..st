accessing
activeWorkingCopy: aWorkingCopy
	activeWorkingCopy ifNotNil: [activeWorkingCopy removeDependent: self].
	activeWorkingCopy := aWorkingCopy.
	activeWorkingCopy ifNotNil: [activeWorkingCopy addDependent: self].
	self
		changed: #activeWorkingCopy;
		changed: #assetList.
	activeWorkingCopy ifNil: [self selectedMapper: nil].