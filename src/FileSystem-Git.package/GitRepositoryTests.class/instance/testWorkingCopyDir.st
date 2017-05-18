tests
testWorkingCopyDir
	self assert: repository workingCopyDir = reference parent.
	
	repository configAt: 'core.worktree' put: (reference parent / 'other directory') pathString.
	self assert: repository workingCopyDir = (reference parent / 'other directory').
	
	repository configAt: 'core.bare' put: 'true'.
	self should: [repository workingCopyDir] raise: GitError.