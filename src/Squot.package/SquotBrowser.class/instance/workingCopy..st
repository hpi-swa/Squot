accessing
workingCopy: aWorkingCopy
	workingCopy ifNotNil: [workingCopy removeDependent: self].
	workingCopy := aWorkingCopy.
	workingCopy ifNotNil: [workingCopy addDependent: self].