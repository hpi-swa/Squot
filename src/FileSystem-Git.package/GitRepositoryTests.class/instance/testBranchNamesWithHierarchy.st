tests
testBranchNamesWithHierarchy
	| branches |
	self unitOfWork
		updateRef: 'refs/heads/test/a' to: (self unitOfWork resolveRef: 'master');
		updateRef: 'refs/heads/test/b' to: (self unitOfWork resolveRef: 'branch1').
	branches := self unitOfWork branchNames.
	self assert: branches asSet equals: #('master' 'branch1' 'feature/x' 'test/a' 'test/b') asSet.