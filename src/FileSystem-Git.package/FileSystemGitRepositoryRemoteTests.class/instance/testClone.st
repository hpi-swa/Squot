tests
testClone
	| repo master |
	repo := FileSystemGitRepository on: FileSystem memory root.
	repo withUnitOfWork: [repo cloneFrom: self remoteUrl].
	repo withUnitOfWork: [
	self assert: (repo branches includesKey: 'master')
		description: 'should have obtained master, got: ', (repo branches keys joinSeparatedBy: ' ').
	master := repo branches at: 'master'.
	self assert: (master / 'README.md') exists.
	self shouldnt: [repo validate] raise: Error.
	].