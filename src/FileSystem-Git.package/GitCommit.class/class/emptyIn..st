instance creation
emptyIn: aRepository
	^ self
		withTree: (GitTree emptyIn: aRepository)
		message: ''
		author: GitStamp now
		committer: GitStamp now
		in: aRepository