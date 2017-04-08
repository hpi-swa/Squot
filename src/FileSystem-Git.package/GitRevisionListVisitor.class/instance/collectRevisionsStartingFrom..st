visiting
collectRevisionsStartingFrom: aGitCommitOrCollection
	commitBlock := nil.
	searchFrontier addAll: aGitCommitOrCollection asCollection.
	self performSearch.