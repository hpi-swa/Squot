history walking
walkWhile: aBlockAcceptingOneCommitReturningBoolean startingFrom: aGitCommit
	commitBlock := aBlockAcceptingOneCommitReturningBoolean.
	searchFrontier add: aGitCommit.
	self performSearch.