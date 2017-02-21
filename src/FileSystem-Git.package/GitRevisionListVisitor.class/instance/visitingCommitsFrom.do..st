visiting
visitingCommitsFrom: aGitCommitOrCollection do: aBlock
	commitBlock := aBlock.
	self visit: aGitCommitOrCollection.