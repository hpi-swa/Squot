filesystem
fsCommitFrom: aCommitOrNil
	^ aCommitOrNil
		ifNotNil: [FileSystemGitCommit withCommit: aCommitOrNil in: self fsgitRepository]
		ifNil: [FileSystemGitCommit emptyIn: self fsgitRepository]