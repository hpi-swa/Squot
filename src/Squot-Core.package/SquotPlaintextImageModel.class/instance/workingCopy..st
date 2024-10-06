accessing
workingCopy: aWorkingCopy
	workingCopy ifNotNil: [workingCopy removeDependent: self].
	workingCopy := aWorkingCopy.
	aWorkingCopy ifNotNil: [aWorkingCopy addDependent: self].