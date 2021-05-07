tests
testWorkingCopyDir
	self unitOfWork configUnsetAt: 'core.bare'.
	self assert: self unitOfWork workingCopyDir = reference parent "memory:/".
	self assert: self unitOfWork hasWorkingCopy.
	self unitOfWork configAt: 'core.bare' put: 'true'.
	self deny: self unitOfWork hasWorkingCopy.
	self should: [self unitOfWork workingCopyDir] raise: GitError.