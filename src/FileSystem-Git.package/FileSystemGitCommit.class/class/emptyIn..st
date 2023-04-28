as yet unclassified
emptyIn: aFileSystemGitRepository
	^ self
		withCommit: (GitCommit emptyIn: aFileSystemGitRepository repository)
		in: aFileSystemGitRepository