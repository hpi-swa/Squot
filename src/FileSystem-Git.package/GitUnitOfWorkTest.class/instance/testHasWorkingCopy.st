tests
testHasWorkingCopy
	self unitOfWork configUnsetAt: 'core.bare'.
	self assert: self unitOfWork hasWorkingCopy. "it is not configured to be bare..."
	self unitOfWork configAt: 'core.bare' put: 'true'.
	self deny: self unitOfWork hasWorkingCopy.