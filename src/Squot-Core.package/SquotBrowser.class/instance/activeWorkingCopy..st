accessing
activeWorkingCopy: aWorkingCopy
	activeWorkingCopy == aWorkingCopy ifTrue: [^ self].
	activeWorkingCopy ifNotNil: [activeWorkingCopy removeDependent: self].
	activeWorkingCopy := aWorkingCopy.
	activeWorkingCopy ifNotNil: [activeWorkingCopy addDependent: self].
	self everythingChanged.