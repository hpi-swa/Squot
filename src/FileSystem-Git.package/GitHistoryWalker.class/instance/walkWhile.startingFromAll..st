history walking
walkWhile: aBlockAcceptingOneCommitReturningBoolean startingFromAll: gitCommits
	commitBlock := aBlockAcceptingOneCommitReturningBoolean.
	searchFrontier addAll: gitCommits.
	self performSearch.