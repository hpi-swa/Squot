tests
testStoreObjectCommitNoTree
	| commit |
	commit := GitCommit in: repository.
	self 
		should: [ commit store ] 
		raise: GitInvalidObjectError
		whoseDescriptionIncludes: 'Cannot have a commit without a tree.'
		description: 'Every commit needs a tree. Make sure this is checked for.'