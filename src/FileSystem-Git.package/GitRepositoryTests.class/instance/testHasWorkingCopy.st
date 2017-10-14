tests
testHasWorkingCopy
	repository configUnsetAt: 'core.bare'.
	self assert: repository hasWorkingCopy. "it is not configured to be bare..."
	repository configAt: 'core.bare' put: 'true'.
	self deny: repository hasWorkingCopy.