visiting
collectRevisionsStartingFrom: aGitCommitOrCollection
	commitBlock := nil.
	aGitCommitOrCollection isCollection
		ifTrue: [searchFrontier addAll: aGitCommitOrCollection]
		ifFalse: [searchFrontier add: aGitCommitOrCollection].
	self performSearch.