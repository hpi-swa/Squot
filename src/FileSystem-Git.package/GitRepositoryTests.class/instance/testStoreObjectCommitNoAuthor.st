tests
testStoreObjectCommitNoAuthor
	| commit |
	commit := GitCommit in: repository.
	commit tree: GitTree new.
	self 
		should: [ commit store ] 
		raise: GitInvalidObjectError
		whoseDescriptionIncludes: 'Author identity is required.'
		description: 'Author needs to be set before storing the commit.'