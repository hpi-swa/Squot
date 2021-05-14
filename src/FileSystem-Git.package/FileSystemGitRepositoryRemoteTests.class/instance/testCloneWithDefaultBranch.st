tests
testCloneWithDefaultBranch
	| repo main |
	repo := FileSystemGitRepository on: FileSystem memory root.
	repo withUnitOfWork: [repo cloneFrom: 'https://github.com/j4yk/EmptySquotRepo.git'].
	repo withUnitOfWork: [
	self assert: (repo branches includesKey: 'main')
		description: 'should have obtained main branch, got: ', (repo branches keys joinSeparatedBy: ' ').
	main := repo branches at: 'main'.
	self assert: main equals: repo head;
		assert: (main / 'README.md') exists;
		shouldnt: [repo validate] raise: Error.
	].