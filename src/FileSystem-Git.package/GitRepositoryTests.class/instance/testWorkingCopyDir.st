tests
testWorkingCopyDir
	self unitOfWork configUnsetAt: 'core.bare'.
	self assert: self unitOfWork workingCopyDir = reference parent "memory:/".
	self unitOfWork
		workingCopyDirDo: [:dir | self assert: dir = reference parent]
		ifBare: [self fail: 'should not reach here'].
	self unitOfWork configAt: 'core.bare' put: 'true'.
	self unitOfWork
		workingCopyDirDo: [:dir | self fail: 'should not reach here']
		ifBare: [].