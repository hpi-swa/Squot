tests
testWorkingCopyDir
	repository configUnsetAt: 'core.bare'.
	self assert: repository workingCopyDir = reference parent "memory:/".
	repository
		workingCopyDirDo: [:dir | self assert: dir = reference parent]
		ifBare: [self fail: 'should not reach here'].
	repository configAt: 'core.bare' put: 'true'.
	repository
		workingCopyDirDo: [:dir | self fail: 'should not reach here']
		ifBare: [].