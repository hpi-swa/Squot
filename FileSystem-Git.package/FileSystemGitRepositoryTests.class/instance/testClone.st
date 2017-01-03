tests
testClone
	| repo master |
	repo := FileSystemGitRepository on: FileSystem memory root.
	repo cloneFrom: self remoteUrl.
	self assert: (repo branches includesKey: 'master').
	master := repo branches at: 'master'.
	self assert: (master / 'README.md') exists.
	self shouldnt: [repo validate] raise: Error.