visiting
collectRevisionsStartingFrom: aGitCommitOrCollection
	commitBlock := nil.
	searchFrontier addAll: aGitCommitOrCollection asArray.
	self performSearch.