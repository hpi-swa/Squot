tests
testBranchNamesWithHierarchy
	| branches |
	repository
		updateRef: 'refs/heads/test/a' to: (repository resolveRef: 'master');
		updateRef: 'refs/heads/test/b' to: (repository resolveRef: 'branch1').
	branches := repository branchNames.
	self assert: branches asSet equals: #('master' 'branch1' 'feature/x' 'test/a' 'test/b') asSet.