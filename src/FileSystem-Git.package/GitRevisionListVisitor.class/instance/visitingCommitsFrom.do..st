visiting
visitingCommitsFrom: aGitCommitOrCollection do: aBlock
	commitBlock := aBlock.
	searchFrontier addAll: aGitCommitOrCollection asCollection.
	self performSearch.