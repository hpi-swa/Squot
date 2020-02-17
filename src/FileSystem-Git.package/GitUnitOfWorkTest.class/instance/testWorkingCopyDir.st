tests
testWorkingCopyDir
	repository configUnsetAt: 'core.bare'.
	self assert: repository workingCopyDir = reference parent "memory:/".
	self assert: repository hasWorkingCopy.
	repository configAt: 'core.bare' put: 'true'.
	self deny: repository hasWorkingCopy.
	self should: [repository workingCopyDir] raise: GitError.